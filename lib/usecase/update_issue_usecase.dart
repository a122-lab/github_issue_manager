import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/repository/github_repository.dart';

/// Issueの更新を行うユースケース
class UpdateIssueUseCase {
  final GitHubRepository _repository;

  UpdateIssueUseCase(this._repository);

  Future<IssueModel> updateIssue({
    required int number,
    String? title,
    String? body,
    String? state,
    List<String>? labels,
  }) async {
    try {
      return await _repository.updateIssue(
        number: number,
        title: title,
        body: body,
        state: state,
        labels: labels,
      );
    } catch (e) {
      throw Exception('Issueの更新に失敗しました: $e');
    }
  }
}
