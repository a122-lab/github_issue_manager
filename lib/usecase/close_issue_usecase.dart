import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/repository/github_repository.dart';

/// Issueのクローズ/再オープンを行うユースケース
class CloseIssueUseCase {
  final GitHubRepository _repository;

  CloseIssueUseCase(this._repository);

  Future<IssueModel> closeOrReopenIssue(int number, {bool reopen = false}) async {
    try {
      if (reopen) {
        return await _repository.reopenIssue(number);
      } else {
        return await _repository.closeIssue(number);
      }
    } catch (e) {
      throw Exception('Issueの${reopen ? '再オープン' : 'クローズ'}に失敗しました: $e');
    }
  }
}
