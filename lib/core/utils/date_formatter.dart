/// 日時を "yyyy/MM/dd HH:mm"形式にフォーマット
String formatDateTime(DateTime dateTime) {
  return '${dateTime.year}/${_pad(dateTime.month)}/${_pad(dateTime.day)} '
      '${_pad(dateTime.hour)}:${_pad(dateTime.minute)}';
}

/// 日付を "yyyy/MM/dd" 形式にフォーマット
String formatDate(DateTime dateTime) {
  return '${dateTime.year}/${_pad(dateTime.month)}/${_pad(dateTime.day)}';
}

/// 相対的な時間表示 (例: "2時間前", "3日前")
String formatRelative(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays > 365) {
    final years = (difference.inDays / 365).floor();
    return '$years年前';
  } else if (difference.inDays > 30) {
    final months = (difference.inDays / 30).floor();
    return '$months月前';
  } else if (difference.inDays > 0) {
    return '${difference.inDays}日前';
  } else if (difference.inHours > 0) {
    return '${difference.inHours}時間前';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes}分前';
  } else {
    return 'たった今';
  }
}

/// 2桁にパディング
String _pad(int value) {
  return value.toString().padLeft(2, '0');
}
