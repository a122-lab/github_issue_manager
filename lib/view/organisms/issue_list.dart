import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/molecules/issue_list_item.dart';

/// Component: Issueのリスト
class IssueList extends StatelessWidget {
  final List<IssueModel> issues;
  final bool isLoading;
  final String? error;
  final Function(IssueModel) onIssueTap;
  final VoidCallback onRefresh;

  const IssueList({
    super.key,
    required this.issues,
    required this.isLoading,
    this.error,
    required this.onIssueTap,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    // ローディング中
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // エラー発生時
    if (error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: UIColorConst.error,
            ),
            const SizedBox(height: 16),
            Text(
              'エラーが発生しました',
              style: UITextConst.titleMedium.copyWith(
                color: UIColorConst.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                error!,
                style: UITextConst.bodySmall.copyWith(
                  color: UIColorConst.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRefresh,
              icon: const Icon(Icons.refresh),
              label: const Text('再試行'),
            ),
          ],
        ),
      );
    }

    // Issueが存在しない場合
    if (issues.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.inbox_outlined,
              size: 64,
              color: UIColorConst.textHint,
            ),
            const SizedBox(height: 16),
            Text(
              'Issueがありません',
              style: UITextConst.titleMedium.copyWith(
                color: UIColorConst.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    // Issueがある場合
    return RefreshIndicator(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        itemCount: issues.length,
        padding: const EdgeInsets.only(bottom: 80),
        itemBuilder: (context, index) {
          return IssueListItem(
            issue: issues[index],
            onTap: () => onIssueTap(issues[index]),
          );
        },
      ),
    );
  }
}
