import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/view/organisms/create_issue_form.dart';
import 'package:github_issue_manager/view/pages/issue_tab/create_issue_viewmodel.dart';
import 'package:github_issue_manager/view/pages/issue_tab/issue_list_viewmodel.dart';
import 'package:github_issue_manager/view/templates/background_scaffold.dart';

/// Screen: Issue作成画面
class CreateIssuePage extends ConsumerWidget {
  const CreateIssuePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(createIssueViewModelProvider);
    final issueListNotifier = ref.read(issueListStateProvider.notifier);

    return BackgroundScaffold(
      appBarTitle: 'Create Issue',
      appBarActions: [
        if (viewModel.isCreating)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: UIColorConst.textPrimary,
                ),
              ),
            ),
          )
        else
          TextButton(
            onPressed: () => _createIssue(context, ref, viewModel, issueListNotifier),
            child: const Text(
              '作成',
              style: TextStyle(
                color: UIColorConst.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
      child: GestureDetector(
        onTap: () => primaryFocus?.unfocus(),
        child: CreateIssueForm(
          formKey: viewModel.formKey,
          titleController: viewModel.titleController,
          bodyController: viewModel.bodyController,
          labelsController: viewModel.labelsController,
          assigneeController: viewModel.assigneeController,
        ),
      ),
    );
  }

  /// Issue作成
  Future<void> _createIssue(
    BuildContext context,
    WidgetRef ref,
    CreateIssueViewModel viewModel,
    IssueListViewModel issueListNotifier,
  ) async {
    if (!viewModel.formKey.currentState!.validate()) {
      return;
    }

    viewModel.setCreating(true);

    final success = await issueListNotifier.createIssue(
      title: viewModel.titleController.text,
      body: viewModel.bodyController.text.isEmpty ? null : viewModel.bodyController.text,
      labels: viewModel.getLabels(),
      assignee: viewModel.getAssignee(),
    );

    viewModel.setCreating(false);

    if (!context.mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Issueを作成しました')),
      );
      Navigator.of(context).pop(true);
    } else {
      final error = ref.read(issueListStateProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('作成に失敗しました: $error')),
      );
    }
  }
}
