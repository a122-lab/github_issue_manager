import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/provider/providers.dart';
import 'package:github_issue_manager/state/issue_detail_state.dart';
import 'package:github_issue_manager/usecase/close_issue_usecase.dart';
import 'package:github_issue_manager/usecase/update_issue_usecase.dart';

/// Issue詳細のViewModel
final issueDetailStateProvider =
    StateNotifierProvider.family<IssueDetailViewModel, IssueDetailState, IssueModel>((ref, issue) {
  return IssueDetailViewModel(
    issue,
    ref.watch(updateIssueUseCaseProvider),
    ref.watch(closeIssueUseCaseProvider),
  );
});

class IssueDetailViewModel extends StateNotifier<IssueDetailState> {
  final UpdateIssueUseCase _updateIssueUseCase;
  final CloseIssueUseCase _closeIssueUseCase;

  IssueDetailViewModel(
    IssueModel issue,
    this._updateIssueUseCase,
    this._closeIssueUseCase,
  ) : super(IssueDetailState(issue: issue));

  /// Issue更新
  Future<bool> updateIssue({
    String? title,
    String? body,
    List<String>? labels,
  }) async {
    state = state.copyWith(isUpdating: true, error: null);

    try {
      final updatedIssue = await _updateIssueUseCase.updateIssue(
        number: state.issue.number,
        title: title,
        body: body,
        labels: labels,
      );

      state = state.copyWith(
        issue: updatedIssue,
        isUpdating: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isUpdating: false,
        error: e.toString(),
      );
      return false;
    }
  }

  /// Issueをクローズ/再オープン
  Future<bool> toggleIssueState() async {
    state = state.copyWith(isUpdating: true, error: null);

    try {
      final reopen = state.issue.state == 'closed';
      final updatedIssue = await _closeIssueUseCase.closeOrReopenIssue(
        state.issue.number,
        reopen: reopen,
      );

      state = state.copyWith(
        issue: updatedIssue,
        isUpdating: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isUpdating: false,
        error: e.toString(),
      );
      return false;
    }
  }
}
