import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvKey { githubToken, githubOwner, githubRepo, none }

extension EnvKeyExtension on EnvKey {
  static final envKeys = {
    EnvKey.githubToken: 'GITHUB_TOKEN',
    EnvKey.githubOwner: 'GITHUB_OWNER',
    EnvKey.githubRepo: 'GITHUB_REPO',
    EnvKey.none: '',
  };

  String get key => envKeys[this] ?? EnvKey.none.key;

  String get envValue => dotenv.env[key]!;
}
