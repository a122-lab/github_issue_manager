import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';

/// Component: ユーザーのアイコン
class UserIcon extends StatelessWidget {
  final String imageUrl;
  final double size;
  final VoidCallback? onTap;

  const UserIcon({
    super.key,
    required this.imageUrl,
    this.size = 40,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: UIColorConst.border,
            width: 2,
          ),
        ),
        child: ClipOval(
          child: imageUrl.isNotEmpty
              ? Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  // アイコンが取得できない場合
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                )
              : Container(
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
        ),
      ),
    );
  }
}
