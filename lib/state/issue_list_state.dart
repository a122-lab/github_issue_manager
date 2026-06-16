import 'package:freezed_annotation/freezed_annotation.dart';
import '../model/issue_model.dart';

part 'issue_list_state.freezed.dart';

@freezed
class IssueListState with _$IssueListState {
  const factory IssueListState({
    @Default([]) List<IssueModel> issues,
    @Default('open') String filter,
    @Default(false) bool isLoading,
    String? error,
  }) = _IssueListState;
}