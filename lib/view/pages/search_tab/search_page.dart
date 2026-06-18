import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/state/search_state.dart';
import 'package:github_issue_manager/view/molecules/search_bar.dart';
import 'package:github_issue_manager/view/organisms/issue_list.dart';
import 'package:github_issue_manager/view/pages/issue_tab/issue_detail_page.dart';
import 'package:github_issue_manager/view/pages/search_tab/search_viewmodel.dart';
import 'package:github_issue_manager/view/templates/background_scaffold.dart';

/// Screen: 検索画面
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchStateProvider);
    final notifier = ref.read(searchStateProvider.notifier);

    return BackgroundScaffold(
      appBarTitle: 'Search',
      child: Column(
        children: [
          // 検索バー
          AppSearchBar(
            controller: _searchController,
            hintText: 'Issueを検索',
            onChanged: (value) {
              notifier.updateQuery(value);
            },
            onSubmitted: () {
              if (_searchController.text.isNotEmpty) {
                notifier.search(_searchController.text);
              }
            },
            onClear: () {
              _searchController.clear();
              notifier.clear();
            },
          ),

          // 検索結果
          Expanded(
            child: _buildSearchResults(state, notifier),
          ),
        ],
      ),
    );
  }

  // 検索状態に応じてWidgetを出し分ける
  Widget _buildSearchResults(SearchState state, SearchViewModel notifier) {
    // 初期状態
    if (state.query.isEmpty && state.results.isEmpty && !state.isSearching) {
      return _buildEmptyState(
        icon: Icons.search,
        title: 'Issueを検索',
        message: 'キーワードを入力して検索してください',
      );
    }

    // 検索中
    if (state.isSearching) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // エラー
    if (state.error != null) {
      return _buildEmptyState(
        icon: Icons.error_outline,
        title: 'エラーが発生しました',
        message: state.error!,
        showRetry: true,
        onRetry: () => notifier.search(state.query),
      );
    }

    // 検索結果なし
    if (state.results.isEmpty) {
      return _buildEmptyState(
        icon: Icons.search_off,
        title: '結果が見つかりません',
        message: '「${state.query}」に一致するIssueはありません',
      );
    }

    return Column(
      children: [
        // 結果件数
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(
                '${state.results.length}件の結果',
                style: UITextConst.bodySmall.copyWith(
                  color: UIColorConst.textPrimary,
                ),
              ),
            ],
          ),
        ),

        // 検索結果Issue一覧
        Expanded(
          child: IssueList(
            issues: state.results,
            isLoading: false,
            onIssueTap: (issue) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => IssueDetailPage(issue: issue),
                ),
              );
            },
            onRefresh: () {
              notifier.search(state.query);
            },
          ),
        ),
      ],
    );
  }

  // 検索結果を表示しない場合の空Widget
  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String message,
    bool showRetry = false,
    VoidCallback? onRetry,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: UIColorConst.textHint,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: UITextConst.titleMedium.copyWith(
                color: UIColorConst.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: UITextConst.bodySmall.copyWith(
                color: UIColorConst.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (showRetry && onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('再試行'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
