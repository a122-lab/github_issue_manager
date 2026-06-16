import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/organisms/issue_detail_content.dart';
import 'package:github_issue_manager/view/pages/issue_tab/edit_issue_page.dart';
import 'package:github_issue_manager/view/pages/issue_tab/issue_detail_viewmodel.dart';
import 'package:github_issue_manager/view/pages/issue_tab/issue_list_viewmodel.dart';

/// Screen: Issue詳細画面
class IssueDetailPage extends ConsumerWidget {
  final IssueModel issue;

  const IssueDetailPage({
    super.key,
    required this.issue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(issueDetailStateProvider(issue));
    final notifier = ref.read(issueDetailStateProvider(issue).notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Issue #${state.issue.number}'),
        actions: [
          // 編集ボタン
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditIssuePage(issue: state.issue),
                ),
              );
              // 編集後に一覧も更新
              if (result == true) {
                ref.read(issueListStateProvider.notifier).refresh();
              }
            },
          ),

          // メニュー
          PopupMenuButton<String>(
            onSelected: (value) async {
              await _toggleState(context, notifier);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'toggle',
                child: Row(
                  children: [
                    Icon(
                      state.issue.state == 'open' ? Icons.cancel : Icons.refresh,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      state.issue.state == 'open' ? 'クローズ' : '再オープン',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body:
          state.isUpdating ? const Center(child: CircularProgressIndicator()) : IssueDetailContent(issue: state.issue),
    );
  }

  // Issueのステータスを変更する
  Future<void> _toggleState(
    BuildContext context,
    IssueDetailViewModel notifier,
  ) async {
    final success = await notifier.toggleIssueState();

    if (!context.mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('状態を変更しました')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('状態の変更に失敗しました')),
      );
    }
  }
}
