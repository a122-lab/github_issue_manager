import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/view/molecules/filter_tabs.dart';
import 'package:github_issue_manager/view/organisms/issue_list.dart';
import 'package:github_issue_manager/view/pages/issue_tab/create_issue_page.dart';
import 'package:github_issue_manager/view/pages/issue_tab/issue_detail_page.dart';
import 'package:github_issue_manager/view/pages/issue_tab/issue_list_viewmodel.dart';

/// Screen: Issue一覧画面
class IssueListPage extends ConsumerStatefulWidget {
  const IssueListPage({super.key});

  @override
  ConsumerState<IssueListPage> createState() => _IssueListPageState();
}

class _IssueListPageState extends ConsumerState<IssueListPage> {
  @override
  void initState() {
    super.initState();
    // 初回読み込み
    Future.microtask(() {
      ref.read(issueListStateProvider.notifier).fetchIssues();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(issueListStateProvider);
    final notifier = ref.read(issueListStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Issues'),
        actions: [
          // リロードボタン
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              notifier.refresh();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // フィルタータブ
          FilterTabs(
            currentFilter: state.filter,
            onFilterChanged: (filter) => {notifier.changeFilter(filter)},
          ),

          // Issue一覧
          Expanded(
            child: IssueList(
              issues: state.issues,
              isLoading: state.isLoading,
              error: state.error,
              onIssueTap: (issue) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => IssueDetailPage(issue: issue),
                  ),
                );
              },
              onRefresh: () {
                notifier.refresh();
              },
            ),
          ),
        ],
      ),

      // Issue作成ボタン
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateIssuePage(),
            ),
          );

          // Issue作成後に一覧を更新
          if (result == true) {
            notifier.refresh();
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Issue作成'),
      ),
    );
  }
}
