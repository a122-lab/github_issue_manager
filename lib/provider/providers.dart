import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/repository/github_repository.dart';
import 'package:github_issue_manager/usecase/fetch_issues_usecase.dart';

//========================================
// Repository
// ========================================
final githubRepositoryProvider = Provider<GitHubRepository>((ref) {
  return GitHubRepository();
});

// ========================================
// UseCase
// ========================================
final fetchIssuesUseCaseProvider = Provider<FetchIssuesUseCase>((ref) {
  return FetchIssuesUseCase(ref.watch(githubRepositoryProvider));
});
