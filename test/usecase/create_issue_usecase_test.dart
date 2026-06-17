// デフォルト値と同じ引数を明示的に書きたいため警告を無視
// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:github_issue_manager/model/github_user_model.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/repository/github_repository.dart';
import 'package:github_issue_manager/usecase/create_issue_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_issue_usecase_test.mocks.dart';

@GenerateMocks([GitHubRepository])
void main() {
  final MockGitHubRepository mockRepository = MockGitHubRepository();
  final CreateIssueUseCase target = CreateIssueUseCase(mockRepository);

  setUp(() {
    reset(mockRepository);
  });

  group('CreateIssueUseCase', () {
    test('No.1 タイトルのみでissueを正常に作成できる', () async {
      final createdIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'New Issue',
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
        updatedAt: DateTime.parse('2024-01-01T00:00:00Z'),
        htmlUrl: 'https://github.com/test/repo/issues/1',
      );

      when(mockRepository.createIssue(
        title: anyNamed('title'),
        body: anyNamed('body'),
        labels: anyNamed('labels'),
        assignee: anyNamed('assignee'),
      )).thenAnswer((_) async => createdIssue);

      final result = await target.createIssue(title: 'New Issue');

      expect(result, createdIssue);
      expect(result.title, 'New Issue');

      verify(mockRepository.createIssue(
        title: 'New Issue',
        body: null,
        labels: null,
        assignee: null,
      )).called(1);
    });

    test('No.2 タイトルと本文を指定してissueを作成できる', () async {
      final createdIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Bug Report',
        body: 'This is a bug description',
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
        updatedAt: DateTime.parse('2024-01-01T00:00:00Z'),
        htmlUrl: 'https://github.com/test/repo/issues/1',
      );

      when(mockRepository.createIssue(
        title: anyNamed('title'),
        body: anyNamed('body'),
        labels: anyNamed('labels'),
        assignee: anyNamed('assignee'),
      )).thenAnswer((_) async => createdIssue);

      final result = await target.createIssue(
        title: 'Bug Report',
        body: 'This is a bug description',
      );

      expect(result, createdIssue);
      expect(result.title, 'Bug Report');
      expect(result.body, 'This is a bug description');

      verify(mockRepository.createIssue(
        title: 'Bug Report',
        body: 'This is a bug description',
        labels: null,
        assignee: null,
      )).called(1);
    });

    test('No.3 タイトル、本文、ラベルを指定してissueを作成できる', () async {
      final createdIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Feature Request',
        body: 'Add new feature',
        state: 'open',
        user: const GitHubUserModel(
          id: 1,
          userName: 'testUser',
          avatarUrl: 'https://avatar.url',
          htmlUrl: 'https://github.com/testuser',
        ),
        labels: [
          const LabelModel(id: 1, name: 'bug', color: 'FFFFFF'),
          const LabelModel(id: 2, name: 'feature', color: 'FFFFFF'),
        ],
        assignees: [],
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00Z'),
        htmlUrl: 'https://github.com/test/repo/issues/1',
      );

      when(mockRepository.createIssue(
        title: anyNamed('title'),
        body: anyNamed('body'),
        labels: anyNamed('labels'),
        assignee: anyNamed('assignee'),
      )).thenAnswer((_) async => createdIssue);

      final result = await target.createIssue(
        title: 'Feature Request',
        body: 'Add new feature',
        labels: ['bug', 'feature'],
      );

      expect(result, createdIssue);
      expect(result.labels[0].name, 'bug');
      expect(result.labels[1].name, 'feature');

      verify(mockRepository.createIssue(
        title: 'Feature Request',
        body: 'Add new feature',
        labels: ['bug', 'feature'],
        assignee: null,
      )).called(1);
    });

    test('No.4 すべてのパラメータを指定してissueを作成できる', () async {
      final createdIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Complete Issue',
        body: 'Full description',
        state: 'open',
        user: const GitHubUserModel(
          id: 1,
          userName: 'testUser',
          avatarUrl: 'https://avatar.url',
          htmlUrl: 'https://github.com/testuser',
        ),
        labels: [
          const LabelModel(id: 1, name: 'bug', color: 'FFFFFF'),
          const LabelModel(id: 2, name: 'feature', color: 'FFFFFF'),
        ],
        assignees: [
          const GitHubUserModel(
            id: 1,
            userName: 'assignee1',
            avatarUrl: 'https://avatar.url',
            htmlUrl: 'https://github.com/testuser',
          )
        ],
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00Z'),
        htmlUrl: 'https://github.com/test/repo/issues/1',
      );

      when(mockRepository.createIssue(
        title: anyNamed('title'),
        body: anyNamed('body'),
        labels: anyNamed('labels'),
        assignee: anyNamed('assignee'),
      )).thenAnswer((_) async => createdIssue);

      final result = await target.createIssue(
        title: 'Complete Issue',
        body: 'Full description',
        labels: ['bug', 'feature'],
        assignee: 'assignee1',
      );

      expect(result, createdIssue);
      expect(result.title, 'Complete Issue');
      expect(result.body, 'Full description');
      expect(result.labels[0].name, 'bug');
      expect(result.labels[1].name, 'feature');
      expect(result.assignees[0].userName, 'assignee1');

      verify(mockRepository.createIssue(
        title: 'Complete Issue',
        body: 'Full description',
        labels: ['bug', 'feature'],
        assignee: 'assignee1',
      )).called(1);
    });

    test('No.5 空文字列のタイトルを指定した場合、例外を投げる', () async {
      try {
        await target.createIssue(title: '');
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('タイトルを入力してください'));
      }

      verifyNever(mockRepository.createIssue(
        title: anyNamed('title'),
        body: anyNamed('body'),
        labels: anyNamed('labels'),
        assignee: anyNamed('assignee'),
      ));
    });

    test('No.6 空白のみのタイトルを指定した場合、例外を投げる', () async {
      try {
        await target.createIssue(title: '   ');
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('タイトルを入力してください'));
      }

      verifyNever(mockRepository.createIssue(
        title: anyNamed('title'),
        body: anyNamed('body'),
        labels: anyNamed('labels'),
        assignee: anyNamed('assignee'),
      ));
    });

    test('No.7 リポジトリがエラーをスローした場合、適切なエラーメッセージで例外を投げる', () async {
      when(mockRepository.createIssue(
        title: anyNamed('title'),
        body: anyNamed('body'),
        labels: anyNamed('labels'),
        assignee: anyNamed('assignee'),
      )).thenThrow(Exception('Network error'));

      try {
        await target.createIssue(title: 'Test Issue');
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueの作成に失敗しました'));
        expect(e.toString(), contains('Network error'));
      }

      verify(mockRepository.createIssue(
        title: 'Test Issue',
        body: null,
        labels: null,
        assignee: null,
      )).called(1);
    });

    test('No.8 認証エラーが発生した場合、例外を投げる', () async {
      when(mockRepository.createIssue(
        title: anyNamed('title'),
        body: anyNamed('body'),
        labels: anyNamed('labels'),
        assignee: anyNamed('assignee'),
      )).thenThrow(Exception('認証エラー: GitHubトークンが無効です'));

      try {
        await target.createIssue(title: 'Test Issue');
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueの作成に失敗しました'));
        expect(e.toString(), contains('認証エラー'));
      }

      verify(mockRepository.createIssue(
        title: 'Test Issue',
        body: null,
        labels: null,
        assignee: null,
      )).called(1);
    });
  });
}
