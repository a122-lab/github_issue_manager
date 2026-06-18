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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
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
        decoration: BoxDecoration(
          color: isSelected ? UIColorConst.primaryLight : UIColorConst.surface,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? UIColorConst.primaryDark : UIColorConst.textSecondary,
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
