import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/provider/providers.dart';
import 'package:github_issue_manager/state/issue_list_state.dart';
import 'package:github_issue_manager/usecase/fetch_issues_usecase.dart';

/// Issue一覧のViewModel
final issueListStateProvider = StateNotifierProvider<IssueListViewModel, IssueListState>((ref) {
  return IssueListViewModel(
    ref.watch(fetchIssuesUseCaseProvider),
  );
});

class IssueListViewModel extends StateNotifier<IssueListState> {
  final FetchIssuesUseCase _fetchIssuesUseCase;

  IssueListViewModel(
    this._fetchIssuesUseCase,
  ) : super(const IssueListState());

  /// Issue一覧を取得
  Future<void> fetchIssues() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final issues = await _fetchIssuesUseCase.fetchIssue(state: state.filter);
      state = state.copyWith(
        issues: issues,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// フィルターを変更
  void changeFilter(String filter) {
    state = state.copyWith(filter: filter);
    fetchIssues();
  }

  /// リフレッシュ
  Future<void> refresh() async {
    await fetchIssues();
  }
}
