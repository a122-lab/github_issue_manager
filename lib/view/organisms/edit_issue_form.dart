import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/core/utils/date_formatter.dart' as DateFormatter;
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/atoms/app_text_field.dart';
import 'package:github_issue_manager/view/atoms/status_badge.dart';

/// Component: Issue編集フォーム
class EditIssueForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final IssueModel issue;
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final TextEditingController labelsController;

  const EditIssueForm({
    super.key,
    required this.formKey,
    required this.issue,
    required this.titleController,
    required this.bodyController,
    required this.labelsController,
  });

  @override
  Widget build(BuildContext context) {
    // TODO フォーム外タップでキーボードを閉じるようにしたい
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Issue情報カード
          Card(
            color: UIColorConst.background,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const Icon(Icons.tag, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'Issue #${issue.number}',
                    style: UITextConst.titleSmall.copyWith(
                      color: UIColorConst.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  StatusBadge(state: issue.state),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // タイトル
          AppTextField(
            controller: titleController,
            labelText: 'タイトル *',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'タイトルは必須です';
              }
              return null;
            },
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(Icons.title),
          ),
          const SizedBox(height: 16),

          // 本文
          AppTextField(
            controller: bodyController,
            labelText: '本文',
            maxLines: 10,
            textInputAction: TextInputAction.newline,
            prefixIcon: const Icon(Icons.description),
          ),
          const SizedBox(height: 16),

          // ラベル
          AppTextField(
            controller: labelsController,
            labelText: 'ラベル',
            hintText: 'bug, enhancement (カンマ区切り)',
            helperText: '複数指定する場合はカンマで区切ってください',
            textInputAction: TextInputAction.done,
            prefixIcon: const Icon(Icons.label),
          ),
          const SizedBox(height: 24),

          // 作成情報カード
          Card(
            color: UIColorConst.background,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(
                    Icons.person,
                    '作成者',
                    issue.user.userName,
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    Icons.access_time,
                    '作成日時',
                    DateFormatter.formatDateTime(issue.createdAt),
                  ),
                  if (issue.updatedAt != issue.createdAt) ...[
                    const SizedBox(height: 8),
                    _buildInfoRow(
                      Icons.update,
                      '更新日時',
                      DateFormatter.formatDateTime(issue.updatedAt),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: UIColorConst.textSecondary),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: UITextConst.bodySmall.copyWith(
            color: UIColorConst.textSecondary,
          ),
        ),
        Text(
          value,
          style: UITextConst.bodySmall.copyWith(
            color: UIColorConst.textPrimary,
            fontWeight: UITextConst.semiBold,
          ),
        ),
      ],
    );
  }
}
