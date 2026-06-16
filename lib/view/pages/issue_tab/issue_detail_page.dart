import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/organisms/issue_detail_content.dart';
import 'package:github_issue_manager/view/pages/issue_tab/edit_issue_page.dart';

/// Screen: Issue詳細画面
class IssueDetailPage extends ConsumerWidget {
  final IssueModel issue;

  const IssueDetailPage({
    super.key,
    required this.issue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issue #${issue.number}'),
        actions: [
          // 編集ボタン
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditIssuePage(issue: issue),
                ),
              );
            },
          ),

          // メニュー
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(
                      issue.state == 'open' ? Icons.cancel : Icons.refresh,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      issue.state == 'open' ? 'クローズ' : '再オープン',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: IssueDetailContent(issue: issue),
    );
  }
}
