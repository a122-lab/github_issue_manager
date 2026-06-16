import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_issue_manager/model/issue_model.dart';

part 'issue_detail_state.freezed.dart';

@freezed
class IssueDetailState with _$IssueDetailState {
  const factory IssueDetailState({
    required IssueModel issue,
    @Default(false) bool isUpdating,
    String? error,
  }) = _IssueDetailState;
}
