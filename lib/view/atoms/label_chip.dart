import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/model/issue_model.dart';

/// Component: Issueのラベル
class LabelChip extends StatelessWidget {
  final LabelModel label;
  final VoidCallback? onTap;
  final bool showDelete;
  final VoidCallback? onDelete;

  const LabelChip({
    super.key,
    required this.label,
    this.onTap,
    this.showDelete = false,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _hexToColor(label.color);
    final textColor = _getContrastColor(backgroundColor);

    if (showDelete) {
      return Chip(
        label: Text(
          label.name,
          style: UITextConst.labelSmall.copyWith(color: textColor),
        ),
        backgroundColor: backgroundColor,
        deleteIcon: Icon(Icons.close, size: 16, color: textColor),
        onDeleted: onDelete,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label.name,
          style: UITextConst.labelSmall.copyWith(color: textColor),
        ),
      ),
    );
  }

  Color _hexToColor(String hexColor) {
    final hex = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  Color _getContrastColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
