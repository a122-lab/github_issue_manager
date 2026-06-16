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

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    labelsController.dispose();
    assigneeController.dispose();
    super.dispose();
  }
}
