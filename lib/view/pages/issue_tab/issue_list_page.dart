import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/model/github_user_model.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/molecules/filter_tabs.dart';
import 'package:github_issue_manager/view/organisms/issue_list.dart';
import 'package:github_issue_manager/view/pages/issue_tab/create_issue_page.dart';
import 'package:github_issue_manager/view/pages/issue_tab/issue_detail_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Issues'),
        actions: [
          // リロードボタン
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // フィルタータブ
          FilterTabs(
            currentFilter: 'open',
            onFilterChanged: (filter) => {},
          ),

          // Issue一覧
          Expanded(
            child: IssueList(
              // TODO ダミーデータを仮で表示
              issues: [
                IssueModel(
                    id: 123,
                    number: 11,
                    title: 'dummy issue',
                    body: 'This is dummy data.',
                    state: 'open',
                    user: const GitHubUserModel(id: 123, userName: 'aa', avatarUrl: '', htmlUrl: ''),
                    labels: [const LabelModel(id: 123, name: 'Label A', color: 'a78986')],
                    assignee: const GitHubUserModel(id: 123, userName: 'aa', avatarUrl: '', htmlUrl: ''),
                    createdAt: DateTime(2017, 9, 7, 17, 30),
                    updatedAt: DateTime(2026, 9, 7, 17, 30),
                    htmlUrl: '')
              ],
              isLoading: false,
              onIssueTap: (issue) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => IssueDetailPage(issue: issue),
                  ),
                );
              },
              onRefresh: () {},
            ),
          ),
        ],
      ),

      // Issue作成ボタン
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateIssuePage(),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Issue作成'),
      ),
    );
  }
}
