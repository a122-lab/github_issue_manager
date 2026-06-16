import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/view/organisms/create_issue_form.dart';
import 'package:github_issue_manager/view/pages/issue_tab/create_issue_viewmodel.dart';

/// Screen: Issue作成画面
class CreateIssuePage extends ConsumerWidget {
  const CreateIssuePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(createIssueViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Issue作成'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '作成',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: CreateIssueForm(
        formKey: viewModel.formKey,
        titleController: viewModel.titleController,
        bodyController: viewModel.bodyController,
        labelsController: viewModel.labelsController,
        assigneeController: viewModel.assigneeController,
      ),
    );
  }
}
