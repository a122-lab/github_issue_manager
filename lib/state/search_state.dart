import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_issue_manager/model/issue_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default([]) List<IssueModel> results,
    @Default(false) bool isSearching,
    String? error,
  }) = _SearchState;
}
