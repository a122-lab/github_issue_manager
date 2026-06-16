// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitHubUserModelImpl _$$GitHubUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GitHubUserModelImpl(
      id: (json['id'] as num).toInt(),
      userName: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
      htmlUrl: json['html_url'] as String,
    );

Map<String, dynamic> _$$GitHubUserModelImplToJson(
        _$GitHubUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.userName,
      'avatar_url': instance.avatarUrl,
      'html_url': instance.htmlUrl,
    };
