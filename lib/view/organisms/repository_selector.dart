import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/core/enums/env_key.dart';

/// Component: リポジトリ情報
class RepositorySelector extends StatelessWidget {
  const RepositorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.folder_outlined,
                  color: UIColorConst.textSecondary,
                ),
                const SizedBox(width: 8),
                Text(
                  'リポジトリ情報',
                  style: UITextConst.labelLarge.copyWith(
                    color: UIColorConst.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            _buildInfoRow('オーナー', EnvKey.githubOwner.envValue),
            const SizedBox(height: 8),
            _buildInfoRow('リポジトリ', EnvKey.githubRepo.envValue),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: UITextConst.bodySmall.copyWith(
              color: UIColorConst.textSecondary,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: UITextConst.bodyMedium.copyWith(
              color: UIColorConst.textPrimary,
              fontWeight: UITextConst.semiBold,
            ),
          ),
        ),
      ],
    );
  }
}
