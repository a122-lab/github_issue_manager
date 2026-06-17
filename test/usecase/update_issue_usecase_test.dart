// デフォルト値と同じ引数を明示的に書きたいため警告を無視
// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:github_issue_manager/model/github_user_model.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/repository/github_repository.dart';
import 'package:github_issue_manager/usecase/update_issue_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_issue_usecase_test.mocks.dart';

@GenerateMocks([GitHubRepository])
void main() {
  final MockGitHubRepository mockRepository = MockGitHubRepository();
  final UpdateIssueUseCase target = UpdateIssueUseCase(mockRepository);

  setUp(() {
    reset(mockRepository);
  });

  group('UpdateIssueUseCase', () {
    test('No.1 タイトルのみを更新できる', () async {
      final updatedIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Updated Title',
        body: 'Original body',
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
      );

      when(mockRepository.updateIssue(
        number: anyNamed('number'),
        title: anyNamed('title'),
        body: anyNamed('body'),
        state: anyNamed('state'),
        labels: anyNamed('labels'),
      )).thenAnswer((_) async => updatedIssue);

      final result = await target.updateIssue(
        number: 1,
        title: 'Updated Title',
      );

      expect(result, updatedIssue);
      expect(result.title, 'Updated Title');

      verify(mockRepository.updateIssue(
        number: 1,
        title: 'Updated Title',
        body: null,
        state: null,
        labels: null,
      )).called(1);
    });

    test('No.2 本文のみを更新できる', () async {
      final updatedIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Original Title',
        body: 'Updated body',
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
      );

      when(mockRepository.updateIssue(
        number: anyNamed('number'),
        title: anyNamed('title'),
        body: anyNamed('body'),
        state: anyNamed('state'),
        labels: anyNamed('labels'),
      )).thenAnswer((_) async => updatedIssue);

      final result = await target.updateIssue(
        number: 1,
        body: 'Updated body',
      );

      expect(result, updatedIssue);
      expect(result.body, 'Updated body');

      verify(mockRepository.updateIssue(
        number: 1,
        title: null,
        body: 'Updated body',
        state: null,
        labels: null,
      )).called(1);
    });

    test('No.3 状態のみを更新できる', () async {
      final updatedIssue = IssueModel(
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

      when(mockRepository.updateIssue(
        number: anyNamed('number'),
        title: anyNamed('title'),
        body: anyNamed('body'),
        state: anyNamed('state'),
        labels: anyNamed('labels'),
      )).thenAnswer((_) async => updatedIssue);

      final result = await target.updateIssue(
        number: 1,
        state: 'closed',
      );

      expect(result, updatedIssue);
      expect(result.state, 'closed');

      verify(mockRepository.updateIssue(
        number: 1,
        title: null,
        body: null,
        state: 'closed',
        labels: null,
      )).called(1);
    });

    test('No.4 ラベルのみを更新できる', () async {
      final updatedIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Test Issue',
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
        updatedAt: DateTime.parse('2024-01-02T00:00:00Z'),
        htmlUrl: 'https://github.com/test/repo/issues/1',
      );

      when(mockRepository.updateIssue(
        number: anyNamed('number'),
        title: anyNamed('title'),
        body: anyNamed('body'),
        state: anyNamed('state'),
        labels: anyNamed('labels'),
      )).thenAnswer((_) async => updatedIssue);

      final result = await target.updateIssue(
        number: 1,
        labels: ['bug', 'feature'],
      );

      expect(result, updatedIssue);
      expect(result.labels[0].name, 'bug');
      expect(result.labels[1].name, 'feature');

      verify(mockRepository.updateIssue(
        number: 1,
        title: null,
        body: null,
        state: null,
        labels: ['bug', 'feature'],
      )).called(1);
    });

    test('No.5 すべてのパラメータを同時に更新できる', () async {
      final updatedIssue = IssueModel(
        id: 1,
        number: 1,
        title: 'Completely Updated',
        body: 'All fields updated',
        state: 'closed',
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
        updatedAt: DateTime.parse('2024-01-02T00:00:00Z'),
        closedAt: DateTime.parse('2024-01-02T00:00:00Z'),
        htmlUrl: 'https://github.com/test/repo/issues/1',
      );

      when(mockRepository.updateIssue(
        number: anyNamed('number'),
        title: anyNamed('title'),
        body: anyNamed('body'),
        state: anyNamed('state'),
        labels: anyNamed('labels'),
      )).thenAnswer((_) async => updatedIssue);

      final result = await target.updateIssue(
        number: 1,
        title: 'Completely Updated',
        body: 'All fields updated',
        state: 'closed',
        labels: ['bug', 'feature'],
      );

      expect(result, updatedIssue);
      expect(result.title, 'Completely Updated');
      expect(result.body, 'All fields updated');
      expect(result.state, 'closed');
      expect(result.labels[0].name, 'bug');
      expect(result.labels[1].name, 'feature');

      verify(mockRepository.updateIssue(
        number: 1,
        title: 'Completely Updated',
        body: 'All fields updated',
        state: 'closed',
        labels: ['bug', 'feature'],
      )).called(1);
    });

    test('No.6 リポジトリがエラーをスローした場合、適切なエラーメッセージで例外を投げる', () async {
      when(mockRepository.updateIssue(
        number: anyNamed('number'),
        title: anyNamed('title'),
        body: anyNamed('body'),
        state: anyNamed('state'),
        labels: anyNamed('labels'),
      )).thenThrow(Exception('Network error'));

      try {
        await target.updateIssue(number: 1, title: 'Updated Title');
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueの更新に失敗しました'));
        expect(e.toString(), contains('Network error'));
      }

      verify(mockRepository.updateIssue(
        number: 1,
        title: 'Updated Title',
        body: null,
        state: null,
        labels: null,
      )).called(1);
    });

    test('No.7 認証エラーが発生した場合、例外を投げる', () async {
      when(mockRepository.updateIssue(
        number: anyNamed('number'),
        title: anyNamed('title'),
        body: anyNamed('body'),
        state: anyNamed('state'),
        labels: anyNamed('labels'),
      )).thenThrow(Exception('認証エラー: GitHubトークンが無効です'));

      try {
        await target.updateIssue(number: 1, title: 'Updated Title');
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueの更新に失敗しました'));
        expect(e.toString(), contains('認証エラー'));
      }

      verify(mockRepository.updateIssue(
        number: 1,
        title: 'Updated Title',
        body: null,
        state: null,
        labels: null,
      )).called(1);
    });

    test('No.8 存在しないIssue番号で更新しようとした場合、例外を投げる', () async {
      when(mockRepository.updateIssue(
        number: anyNamed('number'),
        title: anyNamed('title'),
        body: anyNamed('body'),
        state: anyNamed('state'),
        labels: anyNamed('labels'),
      )).thenThrow(Exception('Issue not found'));

      try {
        await target.updateIssue(number: 999, title: 'Updated Title');
        fail('例外がスローされるべきなため失敗');
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Issueの更新に失敗しました'));
        expect(e.toString(), contains('Issue not found'));
      }

      verify(mockRepository.updateIssue(
        number: 999,
        title: 'Updated Title',
        body: null,
        state: null,
        labels: null,
      )).called(1);
    });
  });
}
