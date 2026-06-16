import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/atoms/label_chip.dart';

class LabelSelector extends StatelessWidget {
  final List<LabelModel> selectedLabels;
  final ValueChanged<List<LabelModel>> onChanged;

  const LabelSelector({
    super.key,
    required this.selectedLabels,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '選択中のラベル',
          style: UITextConst.labelLarge.copyWith(
            color: UIColorConst.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        if (selectedLabels.isEmpty)
          Text(
            'ラベルが選択されていません',
            style: UITextConst.bodySmall.copyWith(
              color: UIColorConst.textHint,
            ),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: selectedLabels.map((label) {
              return LabelChip(
                label: label,
                showDelete: true,
                onDelete: () {
                  final newLabels = List<LabelModel>.from(selectedLabels)..remove(label);
                  onChanged(newLabels);
                },
              );
            }).toList(),
          ),
      ],
    );
  }
}
