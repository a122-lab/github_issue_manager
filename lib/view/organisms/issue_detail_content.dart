import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/atoms/label_chip.dart';
import 'package:github_issue_manager/view/atoms/user_icon.dart';
import 'package:github_issue_manager/view/molecules/issue_header.dart';

/// Component: Issue詳細のコンテンツ
class IssueDetailContent extends StatelessWidget {
  final IssueModel issue;

  const IssueDetailContent({
    super.key,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        // ヘッダー
        IssueHeader(issue: issue),

        // 本文
        if (issue.body != null && issue.body!.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.description_outlined,
                          size: 20,
                          color: UIColorConst.textSecondary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '説明',
                          style: UITextConst.labelLarge.copyWith(
                            color: UIColorConst.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 12),
                    Text(
                      issue.body!,
                      style: UITextConst.bodyMedium.copyWith(
                        color: UIColorConst.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],

        // ラベル
        if (issue.labels.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.label_outline,
                          size: 20,
                          color: UIColorConst.textSecondary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'ラベル',
                          style: UITextConst.labelLarge.copyWith(
                            color: UIColorConst.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: issue.labels.map((label) => LabelChip(label: label)).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],

        // 担当者
        if (issue.assignee != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 20,
                          color: UIColorConst.textSecondary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '担当者',
                          style: UITextConst.labelLarge.copyWith(
                            color: UIColorConst.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        UserIcon(
                          imageUrl: issue.user.avatarUrl,
                          size: 28,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          issue.assignee!.userName,
                          style: UITextConst.bodyMedium.copyWith(
                            color: UIColorConst.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
