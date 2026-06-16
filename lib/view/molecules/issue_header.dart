import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/core/utils/date_formatter.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/atoms/status_badge.dart';
import 'package:github_issue_manager/view/atoms/user_icon.dart';

/// Component: Issue詳細の基本情報欄
class IssueHeader extends StatelessWidget {
  final IssueModel issue;

  const IssueHeader({
    super.key,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Issue番号とステータス
            Row(
              children: [
                Text(
                  '#${issue.number}',
                  style: UITextConst.titleLarge.copyWith(
                    color: UIColorConst.textPrimary,
                  ),
                ),
                const SizedBox(width: 12),
                StatusBadge(state: issue.state),
              ],
            ),
            const SizedBox(height: 16),

            // タイトル
            Text(
              issue.title,
              style: UITextConst.titleMedium.copyWith(
                color: UIColorConst.textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            const Divider(),
            const SizedBox(height: 16),

            // 作成者情報
            Row(
              children: [
                UserIcon(
                  imageUrl: issue.user.avatarUrl,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        issue.user.userName,
                        style: UITextConst.labelLarge.copyWith(
                          color: UIColorConst.textPrimary,
                        ),
                      ),
                      Text(
                        '作成: ${formatDateTime(issue.createdAt)}',
                        style: UITextConst.caption.copyWith(
                          color: UIColorConst.textSecondary,
                        ),
                      ),
                      if (issue.updatedAt != issue.createdAt)
                        Text(
                          '更新: ${formatDateTime(issue.updatedAt)}',
                          style: UITextConst.caption.copyWith(
                            color: UIColorConst.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
