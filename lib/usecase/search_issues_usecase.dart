import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/repository/github_repository.dart';

/// Issueの検索を行うユースケース
class SearchIssuesUseCase {
  final GitHubRepository _repository;

  SearchIssuesUseCase(this._repository);

  Future<List<IssueModel>> searchIssue(String query) async {
    try {
      if (query.trim().isEmpty) {
        return [];
      }
      return await _repository.searchIssues(query);
    } catch (e) {
      throw Exception('検索に失敗しました: $e');
    }
  }
}
