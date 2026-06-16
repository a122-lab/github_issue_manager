import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ViewModelのProvider
final createIssueViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => CreateIssueViewModel(),
);

class CreateIssueViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController labelsController = TextEditingController();
  final TextEditingController assigneeController = TextEditingController();

  bool _isCreating = false;

  bool get isCreating => _isCreating;

  void setCreating(bool value) {
    _isCreating = value;
    notifyListeners();
  }

  List<String>? getLabels() {
    final labelsText = labelsController.text.trim();
    if (labelsText.isEmpty) return null;

    return labelsText.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
  }

  String? getAssignee() {
    final assignee = assigneeController.text.trim();
    return assignee.isEmpty ? null : assignee;
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    labelsController.dispose();
    assigneeController.dispose();
    super.dispose();
  }
}
