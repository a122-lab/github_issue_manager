// デフォルト値と同じ引数を明示的に書きたいため警告を無視
// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:github_issue_manager/model/github_user_model.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/repository/github_repository.dart';
import 'package:github_issue_manager/usecase/fetch_issues_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_issues_usecase_test.mocks.dart';

@GenerateMocks([GitHubRepository])
void main() {
  group('FetchIssuesUseCase', () {
    final MockGitHubRepository mockRepository = MockGitHubRepository();
    final FetchIssuesUseCase target = FetchIssuesUseCase(mockRepository);

    setUp(() {
      reset(mockRepository);
    });

    test('No.1 リポジトリからissuesを正常に取得できる', () async {
      final mockIssues = [
        IssueModel(
          id: 1,
          number: 1,
          title: 'Test Issue 1',
          body: 'Test body 1',
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
          updatedAt: DateTime.parse('2024-01-02T00:00:00Z'),
          htmlUrl: 'https://github.com/test/repo/issues/1',
        ),
        IssueModel(
          id: 2,
          number: 2,
          title: 'Test Issue 2',
          body: 'Test body 2',
          state: 'open',
          user: const GitHubUserModel(
            id: 2,
            userName: 'testUser2',
            avatarUrl: 'https://avatar2.url',
            htmlUrl: 'https://github.com/testuser2',
          ),
          labels: [],
          assignees: [],
          createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
          updatedAt: DateTime.parse('2024-01-02T00:00:00Z'),
          htmlUrl: 'https://github.com/test/repo/issues/2',
        ),
      ];

      when(mockRepository.fetchIssues(state: anyNamed('state'))).thenAnswer((_) async => mockIssues);

      final result = await target.fetchIssue();

      expect(result, mockIssues);
      expect(result.length, 2);
      expect(result[0].title, 'Test Issue 1');
      expect(result[1].title, 'Test Issue 2');

      verify(mockRepository.fetchIssues(state: 'open')).called(1);
    });

    test('No.2 stateパラメータにopenを指定してissuesを取得できる', () async {
      final mockIssues = [
        IssueModel(
          id: 1,
          number: 1,
          title: 'Open Issue',
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
          updatedAt: DateTime.parse('2024-01-02T00:00:00Z'),
          htmlUrl: 'https://github.com/test/repo/issues/1',
        ),
      ];

      when(mockRepository.fetchIssues(state: 'open')).thenAnswer((_) async => mockIssues);

      final result = await target.fetchIssue(state: 'open');

      expect(result, mockIssues);
      expect(result[0].state, 'open');

      verify(mockRepository.fetchIssues(state: 'open')).called(1);
    });

    test('No.3 stateパラメータにclosedを指定してissuesを取得できる', () async {
      final mockIssues = [
        IssueModel(
          id: 1,
          number: 1,
          title: 'Closed Issue',
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
          closedAt: DateTime.parse('2024-01-03T00:00:00Z'),
          htmlUrl: 'https://github.com/test/repo/issues/1',
        ),
      ];

      when(mockRepository.fetchIssues(state: 'closed')).thenAnswer((_) async => mockIssues);

      final result = await target.fetchIssue(state: 'closed');

      expect(result, mockIssues);
      expect(result[0].state, 'closed');

      verify(mockRepository.fetchIssues(state: 'closed')).called(1);
    });

    test('No.4 stateパラメータにallを指定してissuesを取得できる', () async {
      final mockIssues = [
        IssueModel(
          id: 1,
          number: 1,
          title: 'Open Issue',
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
          updatedAt: DateTime.parse('2024-01-02T00:00:00Z'),
          htmlUrl: 'https://github.com/test/repo/issues/1',
        ),
        IssueModel(
          id: 2,
          number: 2,
          title: 'Closed Issue',
          state: 'closed',
          user: const GitHubUserModel(
            id: 2,
            userName: 'testUser2',
            avatarUrl: 'https://avatar2.url',
            htmlUrl: 'https://github.com/testuser2',
          ),
          labels: [],
          assignees: [],
          createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
          updatedAt: DateTime.parse('2024-01-02T00:00:00Z'),
          closedAt: DateTime.parse('2024-01-03T00:00:00Z'),
          htmlUrl: 'https://github.com/test/repo/issues/2',
        ),
      ];

      when(mockRepository.fetchIssues(state: 'all')).thenAnswer((_) async => mockIssues);

      final result = await target.fetchIssue(state: 'all');

      expect(result, mockIssues);
      expect(result.length, 2);

      verify(mockRepository.fetchIssues(state: 'all')).called(1);
    });

    test('No.5 空のissuesリストを正常に処理できる', () async {
      when(mockRepository.fetchIssues(state: anyNamed('state'))).thenAnswer((_) async => []);

      final result = await target.fetchIssue();

      expect(result, isEmpty);

      verify(mockRepository.fetchIssues(state: 'open')).called(1);
    });

    test('No.6 リポジトリがエラーをスローした場合、適切なエラーメッセージで例外を投げる', () async {
      when(mockRepository.fetchIssues(state: anyNamed('state'))).thenThrow(Exception('Network error'));

      try {
        await target.fetchIssue();
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueの取得に失敗しました'));
        expect(e.toString(), contains('Network error'));
      }

      verify(mockRepository.fetchIssues(state: 'open')).called(1);
    });

    test('No.7 認証エラーが発生した場合、例外を投げる', () async {
      when(mockRepository.fetchIssues(state: anyNamed('state'))).thenThrow(Exception('認証エラー: GitHubトークンが無効です'));

      try {
        await target.fetchIssue();
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueの取得に失敗しました'));
        expect(e.toString(), contains('認証エラー'));
      }

      verify(mockRepository.fetchIssues(state: 'open')).called(1);
    });

    test('No.8 複数のissuesを正常に取得できる', () async {
      final mockIssues = List.generate(
        10,
        (index) => IssueModel(
          id: index + 1,
          number: index + 1,
          title: 'Issue ${index + 1}',
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
          updatedAt: DateTime.parse('2024-01-02T00:00:00Z'),
          htmlUrl: 'https://github.com/test/repo/issues/${index + 1}',
        ),
      );

      when(mockRepository.fetchIssues(state: anyNamed('state'))).thenAnswer((_) async => mockIssues);

      final result = await target.fetchIssue();

      expect(result, mockIssues);
      expect(result.length, 10);
      expect(result.first.title, 'Issue 1');
      expect(result.last.title, 'Issue 10');

      verify(mockRepository.fetchIssues(state: 'open')).called(1);
    });
  });
}
