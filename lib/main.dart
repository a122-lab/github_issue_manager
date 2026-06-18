import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/core/theme/app_theme.dart';
import 'package:github_issue_manager/view/pages/root/root_page.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // .envファイルの読み込み
  await dotenv.load();

  // タイムゾーンの初期化
  tz.initializeTimeZones();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'GitHub Issues',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const RootPage(),
    );
  }
}
