import 'package:flutter/material.dart';

/// 背景画像を適用するための共通Scaffold
class BackgroundScaffold extends StatelessWidget {
  final Widget child;
  final String appBarTitle;
  final List<Widget>? appBarActions;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const BackgroundScaffold({
    super.key,
    required this.child,
    required this.appBarTitle,
    this.appBarActions,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          appBarTitle,
        ),
        actions: appBarActions,
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back_ground.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(child: child),
      ),
    );
  }
}
