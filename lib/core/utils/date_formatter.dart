import 'package:timezone/timezone.dart' as tz;

/// 日時を "yyyy/MM/dd HH:mm"形式にフォーマット
String formatDateTime(DateTime dateTime) {
  final jst = _toJst(dateTime);
  return '${jst.year}/${_pad(jst.month)}/${_pad(jst.day)} '
      '${_pad(jst.hour)}:${_pad(jst.minute)}';
}

/// 日付を "yyyy/MM/dd" 形式にフォーマット
String formatDate(DateTime dateTime) {
  final jst = _toJst(dateTime);
  return '${jst.year}/${_pad(jst.month)}/${_pad(jst.day)}';
}

/// 相対的な時間表示 (例: "2時間前", "3日前")
String formatRelative(DateTime dateTime) {
  final now = DateTime.now();
  final jst = _toJst(dateTime);
  final difference = now.difference(jst);

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

/// DateTimeを日本時間（JST）に変換
DateTime _toJst(DateTime dateTime) {
  final tokyo = tz.getLocation('Asia/Tokyo');
  return tz.TZDateTime.from(dateTime, tokyo);
}

/// 2桁にパディング
String _pad(int value) {
  return value.toString().padLeft(2, '0');
}
