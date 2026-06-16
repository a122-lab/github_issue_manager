import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/organisms/edit_issue_form.dart';
import 'package:github_issue_manager/view/pages/issue_tab/edit_issue_viewmodel.dart';
import 'package:github_issue_manager/view/pages/issue_tab/issue_detail_viewmodel.dart';

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
    final detailNotifier = ref.read(issueDetailStateProvider(issue).notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Issue編集'),
        actions: [
          if (viewModel.isUpdating)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          else
            TextButton(
              onPressed: () => _updateIssue(context, ref, viewModel, detailNotifier),
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

  /// Issueの更新
  Future<void> _updateIssue(
    BuildContext context,
    WidgetRef ref,
    EditIssueViewModel viewModel,
    IssueDetailViewModel detailNotifier,
  ) async {
    if (!viewModel.formKey.currentState!.validate()) {
      return;
    }

    viewModel.setUpdating(true);

    final success = await detailNotifier.updateIssue(
      title: viewModel.titleController.text,
      body: viewModel.bodyController.text.isEmpty ? null : viewModel.bodyController.text,
      labels: viewModel.getLabels(),
    );

    viewModel.setUpdating(false);

    if (!context.mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Issueを更新しました')),
      );
      Navigator.of(context).pop(true);
    } else {
      final error = ref.read(issueDetailStateProvider(issue)).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('更新に失敗しました: $error')),
      );
    }
  }
}
