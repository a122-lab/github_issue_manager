import 'package:flutter_test/flutter_test.dart';
import 'package:github_issue_manager/model/github_user_model.dart';

void main() {
  group('GitHubUserModel', () {
    test('No.1 正常なモデル', () {
      final json = {
        'id': 12345,
        'login': 'testUser',
        'avatar_url': 'https://avatar.url',
        'html_url': 'https://github.com/testuser',
      };

      final user = GitHubUserModel.fromJson(json);

      expect(user.id, 12345);
      expect(user.userName, 'testUser');
      expect(user.avatarUrl, 'https://avatar.url');
      expect(user.htmlUrl, 'https://github.com/testuser');
    });
  });
}
