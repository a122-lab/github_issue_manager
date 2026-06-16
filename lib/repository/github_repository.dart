import 'dart:convert';

import 'package:github_issue_manager/core/enums/env_key.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:http/http.dart' as http;

/// GitHubとの接続を行うリポジトリ
class GitHubRepository {
  final String _baseUrl = 'https://api.github.com';

  Map<String, String> get _headers => {
        'Authorization': 'token ${EnvKey.githubToken.envValue}',
        'Accept': 'application/vnd.github.v3+json',
      };

  String get _repoPath => 'repos/${EnvKey.githubOwner.envValue}/${EnvKey.githubRepo.envValue}';

  /// Issue一覧を取得する
  Future<List<IssueModel>> fetchIssues({String state = 'open'}) async {
    final url = '$_baseUrl/$_repoPath/issues?state=$state&per_page=100';

    print('🔍 Fetching issues from: $url');
    print('📁 Repo: ${EnvKey.githubOwner.envValue}/${EnvKey.githubRepo.envValue}');

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: _headers,
      );

      print('📊 Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List<dynamic>;

        // Pull Requestを除外（pull_requestキーが存在しないものだけ）
        final issuesOnly = data.where((json) => json['pull_request'] == null).toList();

        print(
            '✅ Successfully fetched ${data.length} items (${issuesOnly.length} issues, ${data.length - issuesOnly.length} pull requests)');

        return issuesOnly.map((json) => IssueModel.fromGitHub(json as Map<String, dynamic>)).toList();
      } else if (response.statusCode == 401) {
        throw Exception('認証エラー: GitHubトークンが無効です');
      } else if (response.statusCode == 404) {
        throw Exception('リポジトリが見つかりません: ${EnvKey.githubOwner.envValue}/${EnvKey.githubRepo.envValue}');
      } else {
        final errorBody = json.decode(response.body);
        throw Exception('Failed to fetch issues: ${response.statusCode}\n${errorBody['message'] ?? response.body}');
      }
    } catch (e) {
      print('❌ Error fetching issues: $e');
      rethrow;
    }
  }

  /// Issue更新
  Future<IssueModel> updateIssue({
    required int number,
    String? title,
    String? body,
    String? state,
    List<String>? labels,
  }) async {
    final requestBody = {
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (state != null) 'state': state,
      if (labels != null) 'labels': labels,
    };

    print('🔄 Updating issue #$number');

    final response = await http.patch(
      Uri.parse('$_baseUrl/$_repoPath/issues/$number'),
      headers: {..._headers, 'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    print('📊 Update response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('✅ Issue updated successfully');
      return IssueModel.fromGitHub(json.decode(response.body) as Map<String, dynamic>);
    } else {
      final errorBody = json.decode(response.body);
      throw Exception('Failed to update issue: ${response.statusCode}\n${errorBody['message'] ?? response.body}');
    }
  }

  /// Issueクローズ
  Future<IssueModel> closeIssue(int number) async {
    return await updateIssue(number: number, state: 'closed');
  }

  /// Issue再オープン
  Future<IssueModel> reopenIssue(int number) async {
    return await updateIssue(number: number, state: 'open');
  }
}
