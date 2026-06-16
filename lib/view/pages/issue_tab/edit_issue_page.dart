import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/organisms/edit_issue_form.dart';
import 'package:github_issue_manager/view/pages/issue_tab/edit_issue_viewmodel.dart';

/// Screen: Issue編集画面
class EditIssuePage extends ConsumerWidget {
  final IssueModel issue;

  const EditIssuePage({
    super.key,
    required this.issue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(editIssueViewModelProvider(issue));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Issue編集'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '保存',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: EditIssueForm(
        formKey: viewModel.formKey,
        issue: issue,
        titleController: viewModel.titleController,
        bodyController: viewModel.bodyController,
        labelsController: viewModel.labelsController,
      ),
    );
  }
}
