import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';

// Component: Issueをフィルタリングするタブ
class FilterTabs extends StatelessWidget {
  final String currentFilter;
  final ValueChanged<String> onFilterChanged;

  const FilterTabs({
    super.key,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UIColorConst.surface,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: _buildTab('open', 'Open', Icons.circle_outlined),
          ),
          Expanded(
            child: _buildTab('closed', 'Closed', Icons.check_circle),
          ),
          Expanded(
            child: _buildTab('all', 'All', Icons.list),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String filter, String label, IconData icon) {
    final isSelected = currentFilter == filter;

    return InkWell(
      onTap: () => onFilterChanged(filter),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? UIColorConst.primary : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? UIColorConst.primary : UIColorConst.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: UITextConst.labelMedium.copyWith(
                color: isSelected ? UIColorConst.primary : UIColorConst.textSecondary,
                fontWeight: isSelected ? UITextConst.bold : UITextConst.regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
