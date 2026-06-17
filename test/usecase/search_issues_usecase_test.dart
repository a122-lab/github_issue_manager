import 'package:flutter_test/flutter_test.dart';
import 'package:github_issue_manager/model/github_user_model.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/repository/github_repository.dart';
import 'package:github_issue_manager/usecase/search_issues_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_issues_usecase_test.mocks.dart';

@GenerateMocks([GitHubRepository])
void main() {
  final MockGitHubRepository mockRepository = MockGitHubRepository();
  final SearchIssuesUseCase target = SearchIssuesUseCase(mockRepository);

  setUp(() {
    reset(mockRepository);
  });

  group('SearchIssuesUseCase', () {
    test('No.1 検索クエリに一致するissuesを正常に取得できる', () async {
      final mockIssues = [
        IssueModel(
          id: 1,
          number: 1,
          title: 'Bug in search feature',
          body: 'Search is not working',
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

      when(mockRepository.searchIssues(any)).thenAnswer((_) async => mockIssues);

      final result = await target.searchIssue('search');

      expect(result, mockIssues);
      expect(result.length, 1);
      expect(result[0].title, 'Bug in search feature');

      verify(mockRepository.searchIssues('search')).called(1);
    });

    test('No.2 空文字列の検索クエリの場合は検索実行せずに空リストを返す', () async {
      final result = await target.searchIssue('');

      expect(result, isEmpty);

      verifyNever(mockRepository.searchIssues(any));
    });

    test('No.3 空白のみの検索クエリの場合は検索実行せずに空リストを返す', () async {
      final result = await target.searchIssue('   ');

      expect(result, isEmpty);

      verifyNever(mockRepository.searchIssues(any));
    });

    test('No.4 検索結果が空の場合は空リストを返す', () async {
      when(mockRepository.searchIssues(any)).thenAnswer((_) async => []);

      final result = await target.searchIssue('notFound');

      expect(result, isEmpty);

      verify(mockRepository.searchIssues('notFound')).called(1);
    });

    test('No.5 リポジトリがエラーをスローした場合、適切なエラーメッセージで例外を投げる', () async {
      when(mockRepository.searchIssues(any)).thenThrow(Exception('Network error'));

      try {
        await target.searchIssue('test');
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('検索に失敗しました'));
      }

      verify(mockRepository.searchIssues('test')).called(1);
    });

    test('No.6 複数の検索結果を正常に処理できる', () async {
      final mockIssues = [
        IssueModel(
          id: 1,
          number: 1,
          title: 'First issue',
          state: 'open',
          user: const GitHubUserModel(
            id: 1,
            userName: 'user1',
            avatarUrl: 'https://avatar1.url',
            htmlUrl: 'https://github.com/user1',
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
          title: 'Second issue',
          state: 'closed',
          user: const GitHubUserModel(
            id: 2,
            userName: 'user2',
            avatarUrl: 'https://avatar2.url',
            htmlUrl: 'https://github.com/user2',
          ),
          labels: [],
          assignees: [],
          createdAt: DateTime.parse('2024-01-03T00:00:00Z'),
          updatedAt: DateTime.parse('2024-01-04T00:00:00Z'),
          htmlUrl: 'https://github.com/test/repo/issues/2',
        ),
        IssueModel(
          id: 3,
          number: 3,
          title: 'Third issue',
          state: 'open',
          user: const GitHubUserModel(
            id: 3,
            userName: 'user3',
            avatarUrl: 'https://avatar3.url',
            htmlUrl: 'https://github.com/user3',
          ),
          labels: [],
          assignees: [],
          createdAt: DateTime.parse('2024-01-05T00:00:00Z'),
          updatedAt: DateTime.parse('2024-01-06T00:00:00Z'),
          htmlUrl: 'https://github.com/test/repo/issues/3',
        ),
      ];

      when(mockRepository.searchIssues(any)).thenAnswer((_) async => mockIssues);

      final result = await target.searchIssue('issue');

      expect(result, mockIssues);
      expect(result.length, 3);
      expect(result[0].title, 'First issue');
      expect(result[1].title, 'Second issue');
      expect(result[2].title, 'Third issue');

      verify(mockRepository.searchIssues('issue')).called(1);
    });

    test('No.7 前後の空白を含む検索クエリを正しく処理できる', () async {
      final mockIssues = [
        IssueModel(
          id: 1,
          number: 1,
          title: 'Test issue',
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

      when(mockRepository.searchIssues(any)).thenAnswer((_) async => mockIssues);

      final result = await target.searchIssue('  test query  ');

      expect(result, mockIssues);

      verify(mockRepository.searchIssues('  test query  ')).called(1);
    });
  });
}
