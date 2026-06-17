import 'package:flutter_test/flutter_test.dart';
import 'package:github_issue_manager/core/utils/date_formatter.dart';

void main() {
  group('DateFormatter', () {
    group('formatDateTime', () {
      test('No.1 正常系：日時を "yyyy/MM/dd HH:mm"形式にフォーマットできる', () {
        final dateTime = DateTime(2024, 1, 5, 14, 30);

        final result = formatDateTime(dateTime);

        expect(result, '2024/01/05 14:30');
      });

      test('No.2 ゼロパディング：1桁の月日時分をゼロパディングできる', () {
        final dateTime = DateTime(2024, 3, 9, 8, 5);

        final result = formatDateTime(dateTime);

        expect(result, '2024/03/09 08:05');
      });

      test('No.3 境界値：12月31日23時59分を正しくフォーマットできる', () {
        final dateTime = DateTime(2024, 12, 31, 23, 59);

        final result = formatDateTime(dateTime);

        expect(result, '2024/12/31 23:59');
      });
    });

    group('formatDate', () {
      test('No.1 正常系：日付を "yyyy/MM/dd" 形式にフォーマットできる', () {
        final dateTime = DateTime(2024, 1, 5, 14, 30);

        final result = formatDate(dateTime);

        expect(result, '2024/01/05');
      });

      test('No.2 ゼロパディング：1桁の月日をゼロパディングできる', () {
        final dateTime = DateTime(2024, 3, 9);

        final result = formatDate(dateTime);

        expect(result, '2024/03/09');
      });

      test('No.3 時刻情報あり：時刻情報があっても日付のみをフォーマットできる', () {
        final dateTime = DateTime(2024, 6, 15, 23, 59, 59);

        final result = formatDate(dateTime);

        expect(result, '2024/06/15');
      });
    });

    group('formatRelative', () {
      test('No.1 1分未満の場合は "たった今" を返す', () {
        final now = DateTime.now();
        final dateTime = now.subtract(const Duration(seconds: 30));

        final result = formatRelative(dateTime);

        expect(result, 'たった今');
      });

      test('No.2 30分前の場合は "30分前" を返す', () {
        final now = DateTime.now();
        final dateTime = now.subtract(const Duration(minutes: 30));

        final result = formatRelative(dateTime);

        expect(result, '30分前');
      });

      test('No.3 2時間前の場合は "2時間前" を返す', () {
        final now = DateTime.now();
        final dateTime = now.subtract(const Duration(hours: 2));

        final result = formatRelative(dateTime);

        expect(result, '2時間前');
      });

      test('No.4 5日前の場合は "5日前" を返す', () {
        final now = DateTime.now();
        final dateTime = now.subtract(const Duration(days: 5));

        final result = formatRelative(dateTime);

        expect(result, '5日前');
      });

      test('No.5 2ヶ月前の場合は "2月前" を返す', () {
        final now = DateTime.now();
        final dateTime = now.subtract(const Duration(days: 65));

        final result = formatRelative(dateTime);

        expect(result, '2月前');
      });

      test('No.6 1年前の場合は "1年前" を返す', () {
        final now = DateTime.now();
        final dateTime = now.subtract(const Duration(days: 370));

        final result = formatRelative(dateTime);

        expect(result, '1年前');
      });

      test('No.7 2年前の場合は "2年前" を返す', () {
        final now = DateTime.now();
        final dateTime = now.subtract(const Duration(days: 800));

        final result = formatRelative(dateTime);

        expect(result, '2年前');
      });

      test('No.8 境界値:ちょうど1時間前の場合は "1時間前" を返す', () {
        final now = DateTime.now();
        final dateTime = now.subtract(const Duration(hours: 1));

        final result = formatRelative(dateTime);

        expect(result, '1時間前');
      });

      test('No.9 境界値: ちょうど1日前の場合は "1日前" を返す', () {
        final now = DateTime.now();
        final dateTime = now.subtract(const Duration(days: 1));

        final result = formatRelative(dateTime);

        expect(result, '1日前');
      });
    });
  });
}
