import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:github_issue_manager/model/github_user_model.dart';

part 'issue_model.freezed.dart';
part 'issue_model.g.dart';

@freezed
class IssueModel with _$IssueModel {
  const factory IssueModel({
    required int id,
    required int number,
    required String title,
    String? body,
    required String state,
    required GitHubUserModel user,
    @Default([]) List<LabelModel> labels,
    @Default([]) List<GitHubUserModel> assignees,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'closed_at') DateTime? closedAt,
    @JsonKey(name: 'html_url') required String htmlUrl,
  }) = _IssueModel;

  factory IssueModel.fromJson(Map<String, dynamic> json) => _$IssueModelFromJson(json);

  // GitHub APIのレスポンスから生成するファクトリーメソッド
  factory IssueModel.fromGitHub(Map<String, dynamic> json) {
    return IssueModel(
      id: json['id'] as int,
      number: json['number'] as int,
      title: json['title'] as String,
      body: json['body'] as String?,
      state: json['state'] as String,
      user: GitHubUserModel.fromJson(json['user'] as Map<String, dynamic>),
      labels: (json['labels'] as List<dynamic>?)
              ?.map((label) => LabelModel.fromJson(label as Map<String, dynamic>))
              .toList() ??
          [],
      assignees: (json['assignees'] as List<dynamic>?)
              ?.map((assignee) => GitHubUserModel.fromJson(assignee as Map<String, dynamic>))
              .toList() ??
          [],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      closedAt: json['closed_at'] != null ? DateTime.parse(json['closed_at'] as String) : null,
      htmlUrl: json['html_url'] as String,
    );
  }
}

@freezed
class LabelModel with _$LabelModel {
  const factory LabelModel({
    required int id,
    required String name,
    required String color,
    String? description,
  }) = _LabelModel;

  factory LabelModel.fromJson(Map<String, dynamic> json) => _$LabelModelFromJson(json);
}
