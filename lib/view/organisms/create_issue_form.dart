import 'package:flutter/material.dart';
import 'package:github_issue_manager/view/atoms/app_text_field.dart';

/// Component: Issue作成フォーム
class CreateIssueForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final TextEditingController labelsController;
  final TextEditingController assigneeController;

  const CreateIssueForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.bodyController,
    required this.labelsController,
    required this.assigneeController,
  });

  @override
  Widget build(BuildContext context) {
    // TODO フォーム外タップでキーボードを閉じるようにしたい
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // タイトル
          AppTextField(
            controller: titleController,
            labelText: 'タイトル *',
            hintText: 'Issueのタイトルを入力',
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
            hintText: 'Issueの詳細を入力',
            maxLines: 8,
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
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(Icons.label),
          ),
          const SizedBox(height: 16),

          // 担当者
          AppTextField(
            controller: assigneeController,
            labelText: '担当者',
            hintText: 'GitHubユーザー名',
            textInputAction: TextInputAction.done,
            prefixIcon: const Icon(Icons.person),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
