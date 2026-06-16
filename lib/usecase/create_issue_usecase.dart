import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/repository/github_repository.dart';

/// Issue作成のユースケース
class CreateIssueUseCase {
  final GitHubRepository _repository;

  CreateIssueUseCase(this._repository);

  Future<IssueModel> createIssue({
    required String title,
    String? body,
    List<String>? labels,
    String? assignee,
  }) async {
    try {
      if (title.trim().isEmpty) {
        throw Exception('タイトルを入力してください');
      }

      return await _repository.createIssue(
        title: title,
        body: body,
        labels: labels,
        assignee: assignee,
      );
    } catch (e) {
      throw Exception('Issueの作成に失敗しました: $e');
    }
  }
}
