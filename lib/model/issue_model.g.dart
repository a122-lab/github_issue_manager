// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssueModelImpl _$$IssueModelImplFromJson(Map<String, dynamic> json) =>
    _$IssueModelImpl(
      id: (json['id'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String?,
      state: json['state'] as String,
      user: GitHubUserModel.fromJson(json['user'] as Map<String, dynamic>),
      labels: (json['labels'] as List<dynamic>?)
              ?.map((e) => LabelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      assignees: (json['assignees'] as List<dynamic>?)
              ?.map((e) => GitHubUserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      closedAt: json['closed_at'] == null
          ? null
          : DateTime.parse(json['closed_at'] as String),
      htmlUrl: json['html_url'] as String,
    );

Map<String, dynamic> _$$IssueModelImplToJson(_$IssueModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'title': instance.title,
      'body': instance.body,
      'state': instance.state,
      'user': instance.user,
      'labels': instance.labels,
      'assignees': instance.assignees,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'closed_at': instance.closedAt?.toIso8601String(),
      'html_url': instance.htmlUrl,
    };

_$LabelModelImpl _$$LabelModelImplFromJson(Map<String, dynamic> json) =>
    _$LabelModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      color: json['color'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$LabelModelImplToJson(_$LabelModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'description': instance.description,
    };
