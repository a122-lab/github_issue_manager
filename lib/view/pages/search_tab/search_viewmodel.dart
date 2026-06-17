import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/provider/providers.dart';
import 'package:github_issue_manager/state/search_state.dart';
import 'package:github_issue_manager/usecase/search_issues_usecase.dart';

/// 検索のViewModel
final searchStateProvider = StateNotifierProvider<SearchViewModel, SearchState>((ref) {
  return SearchViewModel(ref.watch(searchIssuesUseCaseProvider));
});

class SearchViewModel extends StateNotifier<SearchState> {
  final SearchIssuesUseCase _searchIssuesUseCase;

  SearchViewModel(this._searchIssuesUseCase) : super(const SearchState());

  /// 検索実行
  Future<void> search(String query) async {
    // 空文字で検索実行された場合には空の検索結果を返して終了する
    if (query.trim().isEmpty) {
      state = const SearchState();
      return;
    }

    // 検索中フラグを立てる
    state = state.copyWith(
      query: query,
      isSearching: true,
      error: null,
    );

    try {
      final results = await _searchIssuesUseCase.searchIssue(query);
      // 検索が終了したら検索中フラグを倒す
      state = state.copyWith(
        results: results,
        isSearching: false,
      );
    } catch (e) {
      state = state.copyWith(
        isSearching: false,
        error: e.toString(),
      );
    }
  }

  /// 検索クリア
  void clear() {
    state = const SearchState();
  }

  /// クエリ更新（検索は実行しない）
  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }
}
