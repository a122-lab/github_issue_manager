import 'package:flutter_test/flutter_test.dart';
import 'package:github_issue_manager/model/issue_model.dart';

void main() {
  group('IssueModel', () {
    test('No.1 nullを含まない場合', () {
      final json = {
        'id': 12345,
        'number': 1,
        'title': 'Test Issue',
        'body': 'Test body',
        'state': 'open',
        'user': {
          'id': 1,
          'login': 'testUser',
          'avatar_url': 'https://avatar.url',
          'html_url': 'https://github.com/testuser',
        },
        'labels': [
          {
            'id': 1,
            'name': 'bug',
            'color': 'd73a4a',
            'description': "Something isn't working",
          },
          {
            'id': 2,
            'name': 'enhancement',
            'color': 'a2eeef',
            'description': 'New feature or request',
          },
        ],
        'assignees': [
          {
            'id': 2,
            'login': 'assigneeUser',
            'avatar_url': 'https://avatar2.url',
            'html_url': 'https://github.com/assigneeuser',
          }
        ],
        'created_at': '2024-01-01T00:00:00Z',
        'updated_at': '2024-01-02T00:00:00Z',
        'closed_at': null,
        'html_url': 'https://github.com/test/repo/issues/1',
      };

      final issue = IssueModel.fromGitHub(json);

      expect(issue.id, 12345);
      expect(issue.number, 1);
      expect(issue.title, 'Test Issue');
      expect(issue.body, 'Test body');
      expect(issue.state, 'open');
      expect(issue.user.userName, 'testUser');
      expect(issue.labels.length, 2);
      expect(issue.labels[0].name, 'bug');
      expect(issue.labels[0].color, 'd73a4a');
      expect(issue.labels[0].description, "Something isn't working");
      expect(issue.labels[1].name, 'enhancement');
      expect(issue.assignees[0].userName, 'assigneeUser');
      expect(issue.createdAt, DateTime.parse('2024-01-01T00:00:00Z'));
      expect(issue.updatedAt, DateTime.parse('2024-01-02T00:00:00Z'));
      expect(issue.closedAt, null);
      expect(issue.htmlUrl, 'https://github.com/test/repo/issues/1');
    });

    test('No.2 nullを含む場合', () {
      final json = {
        'id': 67890,
        'number': 2,
        'title': 'Test Issue 2',
        'body': null,
        'state': 'closed',
        'user': {
          'id': 1,
          'login': 'testUser',
          'avatar_url': 'https://avatar.url',
          'html_url': 'https://github.com/testuser',
        },
        'labels': [],
        'assignees': [],
        'created_at': '2024-01-01T00:00:00Z',
        'updated_at': '2024-01-02T00:00:00Z',
        'closed_at': '2024-01-03T00:00:00Z',
        'html_url': 'https://github.com/test/repo/issues/2',
      };

      final issue = IssueModel.fromGitHub(json);

      expect(issue.id, 67890);
      expect(issue.number, 2);
      expect(issue.title, 'Test Issue 2');
      expect(issue.body, null);
      expect(issue.state, 'closed');
      expect(issue.labels, isEmpty);
      expect(issue.assignees, isEmpty);
      expect(issue.closedAt, DateTime.parse('2024-01-03T00:00:00Z'));
    });

    test('No.3 ラベルがnullの場合', () {
      final json = {
        'id': 22222,
        'number': 4,
        'title': 'Test Issue 4',
        'body': 'Test body',
        'state': 'open',
        'user': {
          'id': 1,
          'login': 'testUser',
          'avatar_url': 'https://avatar.url',
          'html_url': 'https://github.com/testuser',
        },
        'labels': null,
        'assignee': null,
        'created_at': '2024-01-01T00:00:00Z',
        'updated_at': '2024-01-02T00:00:00Z',
        'closed_at': null,
        'html_url': 'https://github.com/test/repo/issues/4',
      };

      final issue = IssueModel.fromGitHub(json);

      expect(issue.labels, isEmpty);
    });
  });

  group('LabelModel', () {
    test('No.1 nullを含まない場合', () {
      final json = {
        'id': 1,
        'name': 'bug',
        'color': 'd73a4a',
        'description': "Something isn't working",
      };

      final label = LabelModel.fromJson(json);

      expect(label.id, 1);
      expect(label.name, 'bug');
      expect(label.color, 'd73a4a');
      expect(label.description, "Something isn't working");
    });

    test(
      'No.2 nullを含む場合',
      () {
        final json = {
          'id': 1,
          'name': 'bug',
          'color': 'd73a4a',
          'description': null,
        };

        final label = LabelModel.fromJson(json);

        expect(label.id, 1);
        expect(label.name, 'bug');
        expect(label.color, 'd73a4a');
        expect(label.description, null);
      },
    );
  });
}
