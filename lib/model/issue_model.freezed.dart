// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IssueModel _$IssueModelFromJson(Map<String, dynamic> json) {
  return _IssueModel.fromJson(json);
}

/// @nodoc
mixin _$IssueModel {
  int get id => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  GitHubUserModel get user => throw _privateConstructorUsedError;
  List<LabelModel> get labels => throw _privateConstructorUsedError;
  List<GitHubUserModel> get assignees => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'closed_at')
  DateTime? get closedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;

  /// Serializes this IssueModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IssueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IssueModelCopyWith<IssueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssueModelCopyWith<$Res> {
  factory $IssueModelCopyWith(
          IssueModel value, $Res Function(IssueModel) then) =
      _$IssueModelCopyWithImpl<$Res, IssueModel>;
  @useResult
  $Res call(
      {int id,
      int number,
      String title,
      String? body,
      String state,
      GitHubUserModel user,
      List<LabelModel> labels,
      List<GitHubUserModel> assignees,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'closed_at') DateTime? closedAt,
      @JsonKey(name: 'html_url') String htmlUrl});

  $GitHubUserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$IssueModelCopyWithImpl<$Res, $Val extends IssueModel>
    implements $IssueModelCopyWith<$Res> {
  _$IssueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IssueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? title = null,
    Object? body = freezed,
    Object? state = null,
    Object? user = null,
    Object? labels = null,
    Object? assignees = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? closedAt = freezed,
    Object? htmlUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as GitHubUserModel,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<LabelModel>,
      assignees: null == assignees
          ? _value.assignees
          : assignees // ignore: cast_nullable_to_non_nullable
              as List<GitHubUserModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of IssueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitHubUserModelCopyWith<$Res> get user {
    return $GitHubUserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IssueModelImplCopyWith<$Res>
    implements $IssueModelCopyWith<$Res> {
  factory _$$IssueModelImplCopyWith(
          _$IssueModelImpl value, $Res Function(_$IssueModelImpl) then) =
      __$$IssueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int number,
      String title,
      String? body,
      String state,
      GitHubUserModel user,
      List<LabelModel> labels,
      List<GitHubUserModel> assignees,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'closed_at') DateTime? closedAt,
      @JsonKey(name: 'html_url') String htmlUrl});

  @override
  $GitHubUserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$IssueModelImplCopyWithImpl<$Res>
    extends _$IssueModelCopyWithImpl<$Res, _$IssueModelImpl>
    implements _$$IssueModelImplCopyWith<$Res> {
  __$$IssueModelImplCopyWithImpl(
      _$IssueModelImpl _value, $Res Function(_$IssueModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of IssueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? title = null,
    Object? body = freezed,
    Object? state = null,
    Object? user = null,
    Object? labels = null,
    Object? assignees = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? closedAt = freezed,
    Object? htmlUrl = null,
  }) {
    return _then(_$IssueModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as GitHubUserModel,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<LabelModel>,
      assignees: null == assignees
          ? _value._assignees
          : assignees // ignore: cast_nullable_to_non_nullable
              as List<GitHubUserModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IssueModelImpl implements _IssueModel {
  const _$IssueModelImpl(
      {required this.id,
      required this.number,
      required this.title,
      this.body,
      required this.state,
      required this.user,
      final List<LabelModel> labels = const [],
      final List<GitHubUserModel> assignees = const [],
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'closed_at') this.closedAt,
      @JsonKey(name: 'html_url') required this.htmlUrl})
      : _labels = labels,
        _assignees = assignees;

  factory _$IssueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IssueModelImplFromJson(json);

  @override
  final int id;
  @override
  final int number;
  @override
  final String title;
  @override
  final String? body;
  @override
  final String state;
  @override
  final GitHubUserModel user;
  final List<LabelModel> _labels;
  @override
  @JsonKey()
  List<LabelModel> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  final List<GitHubUserModel> _assignees;
  @override
  @JsonKey()
  List<GitHubUserModel> get assignees {
    if (_assignees is EqualUnmodifiableListView) return _assignees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignees);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'closed_at')
  final DateTime? closedAt;
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;

  @override
  String toString() {
    return 'IssueModel(id: $id, number: $number, title: $title, body: $body, state: $state, user: $user, labels: $labels, assignees: $assignees, createdAt: $createdAt, updatedAt: $updatedAt, closedAt: $closedAt, htmlUrl: $htmlUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssueModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            const DeepCollectionEquality()
                .equals(other._assignees, _assignees) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      number,
      title,
      body,
      state,
      user,
      const DeepCollectionEquality().hash(_labels),
      const DeepCollectionEquality().hash(_assignees),
      createdAt,
      updatedAt,
      closedAt,
      htmlUrl);

  /// Create a copy of IssueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IssueModelImplCopyWith<_$IssueModelImpl> get copyWith =>
      __$$IssueModelImplCopyWithImpl<_$IssueModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IssueModelImplToJson(
      this,
    );
  }
}

abstract class _IssueModel implements IssueModel {
  const factory _IssueModel(
          {required final int id,
          required final int number,
          required final String title,
          final String? body,
          required final String state,
          required final GitHubUserModel user,
          final List<LabelModel> labels,
          final List<GitHubUserModel> assignees,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'closed_at') final DateTime? closedAt,
          @JsonKey(name: 'html_url') required final String htmlUrl}) =
      _$IssueModelImpl;

  factory _IssueModel.fromJson(Map<String, dynamic> json) =
      _$IssueModelImpl.fromJson;

  @override
  int get id;
  @override
  int get number;
  @override
  String get title;
  @override
  String? get body;
  @override
  String get state;
  @override
  GitHubUserModel get user;
  @override
  List<LabelModel> get labels;
  @override
  List<GitHubUserModel> get assignees;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'closed_at')
  DateTime? get closedAt;
  @override
  @JsonKey(name: 'html_url')
  String get htmlUrl;

  /// Create a copy of IssueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IssueModelImplCopyWith<_$IssueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LabelModel _$LabelModelFromJson(Map<String, dynamic> json) {
  return _LabelModel.fromJson(json);
}

/// @nodoc
mixin _$LabelModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this LabelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LabelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LabelModelCopyWith<LabelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabelModelCopyWith<$Res> {
  factory $LabelModelCopyWith(
          LabelModel value, $Res Function(LabelModel) then) =
      _$LabelModelCopyWithImpl<$Res, LabelModel>;
  @useResult
  $Res call({int id, String name, String color, String? description});
}

/// @nodoc
class _$LabelModelCopyWithImpl<$Res, $Val extends LabelModel>
    implements $LabelModelCopyWith<$Res> {
  _$LabelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LabelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LabelModelImplCopyWith<$Res>
    implements $LabelModelCopyWith<$Res> {
  factory _$$LabelModelImplCopyWith(
          _$LabelModelImpl value, $Res Function(_$LabelModelImpl) then) =
      __$$LabelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String color, String? description});
}

/// @nodoc
class __$$LabelModelImplCopyWithImpl<$Res>
    extends _$LabelModelCopyWithImpl<$Res, _$LabelModelImpl>
    implements _$$LabelModelImplCopyWith<$Res> {
  __$$LabelModelImplCopyWithImpl(
      _$LabelModelImpl _value, $Res Function(_$LabelModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LabelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? description = freezed,
  }) {
    return _then(_$LabelModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LabelModelImpl implements _LabelModel {
  const _$LabelModelImpl(
      {required this.id,
      required this.name,
      required this.color,
      this.description});

  factory _$LabelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabelModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String color;
  @override
  final String? description;

  @override
  String toString() {
    return 'LabelModel(id: $id, name: $name, color: $color, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color, description);

  /// Create a copy of LabelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LabelModelImplCopyWith<_$LabelModelImpl> get copyWith =>
      __$$LabelModelImplCopyWithImpl<_$LabelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LabelModelImplToJson(
      this,
    );
  }
}

abstract class _LabelModel implements LabelModel {
  const factory _LabelModel(
      {required final int id,
      required final String name,
      required final String color,
      final String? description}) = _$LabelModelImpl;

  factory _LabelModel.fromJson(Map<String, dynamic> json) =
      _$LabelModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get color;
  @override
  String? get description;

  /// Create a copy of LabelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LabelModelImplCopyWith<_$LabelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
