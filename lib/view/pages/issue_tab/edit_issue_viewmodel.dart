import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/model/issue_model.dart';

// ViewModelのProvider
final editIssueViewModelProvider = ChangeNotifierProvider.family.autoDispose<EditIssueViewModel, IssueModel>(
  (ref, issue) => EditIssueViewModel(issue),
);

class EditIssueViewModel extends ChangeNotifier {
  final IssueModel issue;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController bodyController;
  late final TextEditingController labelsController;

  bool _isUpdating = false;

  bool get isUpdating => _isUpdating;

  EditIssueViewModel(this.issue) {
    titleController = TextEditingController(text: issue.title);
    bodyController = TextEditingController(text: issue.body ?? '');
    labelsController = TextEditingController(
      text: issue.labels.map((e) => e.name).join(', '),
    );
  }

  /// Issue更新中かどうかを管理
  void setUpdating(bool value) {
    _isUpdating = value;
    notifyListeners();
  }

  /// Issueのラベルを取得
  List<String>? getLabels() {
    final labelsText = labelsController.text.trim();
    if (labelsText.isEmpty) return null;

    return labelsText.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    labelsController.dispose();
    super.dispose();
  }
}
