import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/core/enums/env_key.dart';
import 'package:github_issue_manager/view/organisms/repository_selector.dart';
import 'package:url_launcher/url_launcher.dart';

/// Screen: 設定画面
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: ListView(
        children: [
          // リポジトリ情報
          const RepositorySelector(),

          // アプリ情報
          _buildSection(
            title: 'アプリ情報',
            children: [
              const ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: UIColorConst.primary,
                ),
                title: Text('バージョン'),
                subtitle: Text('1.0.0'),
              ),
              ListTile(
                leading: const Icon(
                  Icons.code,
                  color: UIColorConst.primary,
                ),
                title: const Text('ライセンス'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  showLicensePage(
                    context: context,
                    applicationName: 'GitHub Issues',
                    applicationVersion: '1.0.0',
                  );
                },
              ),
            ],
          ),

          // GitHub関連
          _buildSection(
            title: 'GitHub',
            children: [
              ListTile(
                leading: const Icon(
                  Icons.open_in_browser,
                  color: UIColorConst.primary,
                ),
                title: const Text('リポジトリをブラウザで開く'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _openRepository(),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // フッター
          Center(
            child: Text(
              'Made with Flutter',
              style: UITextConst.caption.copyWith(
                color: UIColorConst.textHint,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            title,
            style: UITextConst.labelLarge.copyWith(
              color: UIColorConst.primary,
              fontWeight: UITextConst.bold,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Future<void> _openRepository() async {
    final url = 'https://github.com/${EnvKey.githubOwner.envValue}/${EnvKey.githubRepo.envValue}';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
