import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';

/// Component: Issueのステータスバッジ
class StatusBadge extends StatelessWidget {
  final String state;

  const StatusBadge({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final isOpen = state == 'open';
    final backgroundColor = isOpen ? UIColorConst.issueOpen : UIColorConst.issueClosed;
    final icon = isOpen ? Icons.circle_outlined : Icons.check_circle;
    final text = isOpen ? 'Open' : 'Closed';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: isOpen ? UIColorConst.issueOpenText : UIColorConst.issueClosedText),
          const SizedBox(width: 6),
          Text(
            text,
            style: UITextConst.labelMedium.copyWith(
              color: isOpen ? UIColorConst.issueOpenText : UIColorConst.issueClosedText,
              fontWeight: UITextConst.bold,
            ),
          ),
        ],
      ),
    );
  }
}
