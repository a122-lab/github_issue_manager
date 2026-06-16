// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GitHubUserModel _$GitHubUserModelFromJson(Map<String, dynamic> json) {
  return _GitHubUserModel.fromJson(json);
}

/// @nodoc
mixin _$GitHubUserModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'login')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;

  /// Serializes this GitHubUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GitHubUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GitHubUserModelCopyWith<GitHubUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitHubUserModelCopyWith<$Res> {
  factory $GitHubUserModelCopyWith(
          GitHubUserModel value, $Res Function(GitHubUserModel) then) =
      _$GitHubUserModelCopyWithImpl<$Res, GitHubUserModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'login') String userName,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'html_url') String htmlUrl});
}

/// @nodoc
class _$GitHubUserModelCopyWithImpl<$Res, $Val extends GitHubUserModel>
    implements $GitHubUserModelCopyWith<$Res> {
  _$GitHubUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GitHubUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? avatarUrl = null,
    Object? htmlUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GitHubUserModelImplCopyWith<$Res>
    implements $GitHubUserModelCopyWith<$Res> {
  factory _$$GitHubUserModelImplCopyWith(_$GitHubUserModelImpl value,
          $Res Function(_$GitHubUserModelImpl) then) =
      __$$GitHubUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'login') String userName,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'html_url') String htmlUrl});
}

/// @nodoc
class __$$GitHubUserModelImplCopyWithImpl<$Res>
    extends _$GitHubUserModelCopyWithImpl<$Res, _$GitHubUserModelImpl>
    implements _$$GitHubUserModelImplCopyWith<$Res> {
  __$$GitHubUserModelImplCopyWithImpl(
      _$GitHubUserModelImpl _value, $Res Function(_$GitHubUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GitHubUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? avatarUrl = null,
    Object? htmlUrl = null,
  }) {
    return _then(_$GitHubUserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitHubUserModelImpl implements _GitHubUserModel {
  const _$GitHubUserModelImpl(
      {required this.id,
      @JsonKey(name: 'login') required this.userName,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      @JsonKey(name: 'html_url') required this.htmlUrl});

  factory _$GitHubUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GitHubUserModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'login')
  final String userName;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;

  @override
  String toString() {
    return 'GitHubUserModel(id: $id, userName: $userName, avatarUrl: $avatarUrl, htmlUrl: $htmlUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitHubUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userName, avatarUrl, htmlUrl);

  /// Create a copy of GitHubUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GitHubUserModelImplCopyWith<_$GitHubUserModelImpl> get copyWith =>
      __$$GitHubUserModelImplCopyWithImpl<_$GitHubUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitHubUserModelImplToJson(
      this,
    );
  }
}

abstract class _GitHubUserModel implements GitHubUserModel {
  const factory _GitHubUserModel(
          {required final int id,
          @JsonKey(name: 'login') required final String userName,
          @JsonKey(name: 'avatar_url') required final String avatarUrl,
          @JsonKey(name: 'html_url') required final String htmlUrl}) =
      _$GitHubUserModelImpl;

  factory _GitHubUserModel.fromJson(Map<String, dynamic> json) =
      _$GitHubUserModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'login')
  String get userName;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  @JsonKey(name: 'html_url')
  String get htmlUrl;

  /// Create a copy of GitHubUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GitHubUserModelImplCopyWith<_$GitHubUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
