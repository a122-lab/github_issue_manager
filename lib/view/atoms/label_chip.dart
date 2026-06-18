import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/model/issue_model.dart';

/// Component: Issueのラベル
class LabelChip extends StatelessWidget {
  final LabelModel label;

  const LabelChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _hexToColor(label.color);
    final textColor = _getContrastColor(backgroundColor);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label.name,
        style: UITextConst.labelSmall.copyWith(color: textColor),
      ),
    );
  }

  /// 取得した16進カラーコードをColorに変換する
  Color _hexToColor(String hexColor) {
    final hex = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  /// 背景の輝度に応じてテキストの色を決定する
  Color _getContrastColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
