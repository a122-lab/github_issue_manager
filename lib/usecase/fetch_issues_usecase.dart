import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/repository/github_repository.dart';

/// Issue一覧取得のユースケース
class FetchIssuesUseCase {
  final GitHubRepository _repository;

  FetchIssuesUseCase(this._repository);

  Future<List<IssueModel>> fetchIssue({
    String state = 'open',
    int perPage = 100,
  }) async {
    try {
      return await _repository.fetchIssues(
        state: state,
      );
    } catch (e) {
      throw Exception('Issueの取得に失敗しました: $e');
    }
  }
}
