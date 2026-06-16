import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_user_model.freezed.dart';
part 'github_user_model.g.dart';

@freezed
class GitHubUserModel with _$GitHubUserModel {
  const factory GitHubUserModel({
    required int id,
    @JsonKey(name: 'login') required String userName,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @JsonKey(name: 'html_url') required String htmlUrl,
  }) = _GitHubUserModel;

  factory GitHubUserModel.fromJson(Map<String, dynamic> json) => _$GitHubUserModelFromJson(json);
}
