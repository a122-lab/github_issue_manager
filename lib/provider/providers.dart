import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/repository/github_repository.dart';
import 'package:github_issue_manager/usecase/close_issue_usecase.dart';
import 'package:github_issue_manager/usecase/create_issue_usecase.dart';
import 'package:github_issue_manager/usecase/fetch_issues_usecase.dart';
import 'package:github_issue_manager/usecase/update_issue_usecase.dart';

// Repository, UseCaseのProviderは、各ViewModelから呼びやすいよう、ここで一括管理する

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

final createIssueUseCaseProvider = Provider<CreateIssueUseCase>((ref) {
  return CreateIssueUseCase(ref.watch(githubRepositoryProvider));
});

final updateIssueUseCaseProvider = Provider<UpdateIssueUseCase>((ref) {
  return UpdateIssueUseCase(ref.watch(githubRepositoryProvider));
});

final closeIssueUseCaseProvider = Provider<CloseIssueUseCase>((ref) {
  return CloseIssueUseCase(ref.watch(githubRepositoryProvider));
});
