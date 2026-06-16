import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/core/utils/date_formatter.dart' as DateFormatter;
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/atoms/label_chip.dart';
import 'package:github_issue_manager/view/atoms/status_badge.dart';
import 'package:github_issue_manager/view/atoms/user_icon.dart';

/// Component: Issueのリスト1行分
class IssueListItem extends StatelessWidget {
  final IssueModel issue;
  final VoidCallback onTap;

  const IssueListItem({
    super.key,
    required this.issue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ヘッダー（アイコン、ユーザーネーム、作成日時、ステータス）
              Row(
                children: [
                  UserIcon(
                    imageUrl: issue.user.avatarUrl,
                    size: 32,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          issue.user.userName,
                          style: UITextConst.labelMedium.copyWith(
                            color: UIColorConst.textSecondary,
                          ),
                        ),
                        Text(
                          DateFormatter.formatRelative(issue.createdAt),
                          style: UITextConst.caption.copyWith(
                            color: UIColorConst.textHint,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StatusBadge(state: issue.state),
                ],
              ),
              const SizedBox(height: 12),

              // タイトル
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${issue.number}',
                    style: UITextConst.labelMedium.copyWith(
                      color: UIColorConst.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      issue.title,
                      style: UITextConst.titleSmall.copyWith(
                        color: UIColorConst.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              // 本文プレビュー
              if (issue.body != null && issue.body!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  issue.body!,
                  style: UITextConst.bodySmall.copyWith(
                    color: UIColorConst.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],

              // ラベル　3つまで表示
              if (issue.labels.isNotEmpty) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: issue.labels.take(3).map((label) => LabelChip(label: label)).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
