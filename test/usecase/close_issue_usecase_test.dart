// デフォルト値と同じ引数を明示的に書きたいため警告を無視
// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:github_issue_manager/model/github_user_model.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/repository/github_repository.dart';
import 'package:github_issue_manager/usecase/close_issue_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'close_issue_usecase_test.mocks.dart';

@GenerateMocks([GitHubRepository])
void main() {
  final MockGitHubRepository mockRepository = MockGitHubRepository();
  final CloseIssueUseCase target = CloseIssueUseCase(mockRepository);

  setUp(() {
    reset(mockRepository);
  });

  group('CloseIssueUseCase', () {
    test('No.1 Issueを正常にクローズできる', () async {
      final closedIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Test Issue',
        body: 'Test body',
        state: 'closed',
        user: const GitHubUserModel(
          id: 1,
          userName: 'testUser',
          avatarUrl: 'https://avatar.url',
          htmlUrl: 'https://github.com/testuser',
        ),
        labels: [],
        assignees: [],
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-02T00:00:00Z'),
        closedAt: DateTime.parse('2024-01-02T00:00:00Z'),
        htmlUrl: 'https://github.com/test/repo/issues/1',
      );

      when(mockRepository.closeIssue(any)).thenAnswer((_) async => closedIssue);

      final result = await target.closeOrReopenIssue(1);

      expect(result, closedIssue);
      expect(result.state, 'closed');
      expect(result.closedAt, isNotNull);

      verify(mockRepository.closeIssue(1)).called(1);
      verifyNever(mockRepository.reopenIssue(any));
    });

    test('No.2 デフォルトパラメータでIssueをクローズできる', () async {
      final closedIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Test Issue',
        state: 'closed',
        user: const GitHubUserModel(
          id: 1,
          userName: 'testUser',
          avatarUrl: 'https://avatar.url',
          htmlUrl: 'https://github.com/testuser',
        ),
        labels: [],
        assignees: [],
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-02T00:00:00Z'),
        closedAt: DateTime.parse('2024-01-02T00:00:00Z'),
        htmlUrl: 'https://github.com/test/repo/issues/1',
      );

      when(mockRepository.closeIssue(any)).thenAnswer((_) async => closedIssue);

      final result = await target.closeOrReopenIssue(1, reopen: false);

      expect(result.state, 'closed');

      verify(mockRepository.closeIssue(1)).called(1);
      verifyNever(mockRepository.reopenIssue(any));
    });

    test('No.3 Issueを正常に再オープンできる', () async {
      // Arrange
      final reopenedIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Test Issue',
        body: 'Test body',
        state: 'open',
        user: const GitHubUserModel(
          id: 1,
          userName: 'testUser',
          avatarUrl: 'https://avatar.url',
          htmlUrl: 'https://github.com/testuser',
        ),
        labels: [],
        assignees: [],
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-03T00:00:00Z'),
        htmlUrl: 'https://github.com/test/repo/issues/1',
      );

      when(mockRepository.reopenIssue(any)).thenAnswer((_) async => reopenedIssue);

      final result = await target.closeOrReopenIssue(1, reopen: true);

      expect(result, reopenedIssue);
      expect(result.state, 'open');
      expect(result.closedAt, isNull);

      verify(mockRepository.reopenIssue(1)).called(1);
      verifyNever(mockRepository.closeIssue(any));
    });

    test('No.4 既にクローズされているIssueをクローズしようとしても正常に動作する', () async {
      final alreadyClosedIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Already Closed Issue',
        state: 'closed',
        user: const GitHubUserModel(
          id: 1,
          userName: 'testUser',
          avatarUrl: 'https://avatar.url',
          htmlUrl: 'https://github.com/testuser',
        ),
        labels: [],
        assignees: [],
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-02T00:00:00Z'),
        closedAt: DateTime.parse('2024-01-02T00:00:00Z'),
        htmlUrl: 'https://github.com/test/repo/issues/1',
      );

      when(mockRepository.closeIssue(any)).thenAnswer((_) async => alreadyClosedIssue);

      final result = await target.closeOrReopenIssue(1);

      expect(result.state, 'closed');
      expect(result.closedAt, isNotNull);

      verify(mockRepository.closeIssue(1)).called(1);
    });

    test('No.5 既にオープンなIssueを再オープンしようとしても正常に動作する', () async {
      final alreadyOpenIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Already Open Issue',
        state: 'open',
        user: const GitHubUserModel(
          id: 1,
          userName: 'testUser',
          avatarUrl: 'https://avatar.url',
          htmlUrl: 'https://github.com/testuser',
        ),
        labels: [],
        assignees: [],
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-03T00:00:00Z'),
        htmlUrl: 'https://github.com/test/repo/issues/1',
      );

      when(mockRepository.reopenIssue(any)).thenAnswer((_) async => alreadyOpenIssue);

      final result = await target.closeOrReopenIssue(1, reopen: true);

      expect(result.state, 'open');
      expect(result.closedAt, isNull);

      verify(mockRepository.reopenIssue(1)).called(1);
    });

    test('No.6 クローズ時にリポジトリがエラーをスローした場合、適切なエラーメッセージで例外を投げる', () async {
      when(mockRepository.closeIssue(any)).thenThrow(Exception('Network error'));

      try {
        await target.closeOrReopenIssue(1);
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueのクローズに失敗しました'));
        expect(e.toString(), contains('Network error'));
      }

      verify(mockRepository.closeIssue(1)).called(1);
    });

    test('No.7 再オープン時にリポジトリがエラーをスローした場合、適切なエラーメッセージで例外を投げる', () async {
      when(mockRepository.reopenIssue(any)).thenThrow(Exception('Network error'));

      try {
        await target.closeOrReopenIssue(1, reopen: true);
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueの再オープンに失敗しました'));
        expect(e.toString(), contains('Network error'));
      }

      verify(mockRepository.reopenIssue(1)).called(1);
    });

    test('No.8 クローズ時に認証エラーが発生した場合、例外を投げる', () async {
      when(mockRepository.closeIssue(any)).thenThrow(Exception('認証エラー: GitHubトークンが無効です'));

      try {
        await target.closeOrReopenIssue(1);
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueのクローズに失敗しました'));
        expect(e.toString(), contains('認証エラー'));
      }

      verify(mockRepository.closeIssue(1)).called(1);
    });

    test('No.9 再オープン時に認証エラーが発生した場合、例外を投げる', () async {
      when(mockRepository.reopenIssue(any)).thenThrow(Exception('認証エラー: GitHubトークンが無効です'));

      try {
        await target.closeOrReopenIssue(1, reopen: true);
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueの再オープンに失敗しました'));
        expect(e.toString(), contains('認証エラー'));
      }

      verify(mockRepository.reopenIssue(1)).called(1);
    });

    test('No.10 存在しないIssueをクローズしようとした場合、例外を投げる', () async {
      when(mockRepository.closeIssue(any)).thenThrow(Exception('Issue not found'));

      try {
        await target.closeOrReopenIssue(999);
        fail('例外がスローされるべきです');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueのクローズに失敗しました'));
        expect(e.toString(), contains('Issue not found'));
      }

      verify(mockRepository.closeIssue(999)).called(1);
    });

    test('No.11 存在しないIssueを再オープンしようとした場合、例外を投げる', () async {
      when(mockRepository.reopenIssue(any)).thenThrow(Exception('Issue not found'));

      try {
        await target.closeOrReopenIssue(999, reopen: true);
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueの再オープンに失敗しました'));
        expect(e.toString(), contains('Issue not found'));
      }

      verify(mockRepository.reopenIssue(999)).called(1);
    });

    test('No.12 権限エラーでクローズに失敗した場合、例外を投げる', () async {
      when(mockRepository.closeIssue(any)).thenThrow(Exception('権限エラー: このIssueをクローズする権限がありません'));

      try {
        await target.closeOrReopenIssue(1);
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueのクローズに失敗しました'));
        expect(e.toString(), contains('権限エラー'));
      }

      verify(mockRepository.closeIssue(1)).called(1);
    });

    test('No.13 権限エラーで再オープンに失敗した場合、例外を投げる', () async {
      when(mockRepository.reopenIssue(any)).thenThrow(Exception('権限エラー: このIssueを再オープンする権限がありません'));

      try {
        await target.closeOrReopenIssue(1, reopen: true);
        fail('例外がスローされるべきです');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueの再オープンに失敗しました'));
        expect(e.toString(), contains('権限エラー'));
      }

      verify(mockRepository.reopenIssue(1)).called(1);
    });
  });
}
