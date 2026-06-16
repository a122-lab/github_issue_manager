// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IssueListState {
  List<IssueModel> get issues => throw _privateConstructorUsedError;
  String get filter => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of IssueListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IssueListStateCopyWith<IssueListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssueListStateCopyWith<$Res> {
  factory $IssueListStateCopyWith(
          IssueListState value, $Res Function(IssueListState) then) =
      _$IssueListStateCopyWithImpl<$Res, IssueListState>;
  @useResult
  $Res call(
      {List<IssueModel> issues, String filter, bool isLoading, String? error});
}

/// @nodoc
class _$IssueListStateCopyWithImpl<$Res, $Val extends IssueListState>
    implements $IssueListStateCopyWith<$Res> {
  _$IssueListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IssueListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issues = null,
    Object? filter = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      issues: null == issues
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<IssueModel>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IssueListStateImplCopyWith<$Res>
    implements $IssueListStateCopyWith<$Res> {
  factory _$$IssueListStateImplCopyWith(_$IssueListStateImpl value,
          $Res Function(_$IssueListStateImpl) then) =
      __$$IssueListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<IssueModel> issues, String filter, bool isLoading, String? error});
}

/// @nodoc
class __$$IssueListStateImplCopyWithImpl<$Res>
    extends _$IssueListStateCopyWithImpl<$Res, _$IssueListStateImpl>
    implements _$$IssueListStateImplCopyWith<$Res> {
  __$$IssueListStateImplCopyWithImpl(
      _$IssueListStateImpl _value, $Res Function(_$IssueListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of IssueListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issues = null,
    Object? filter = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$IssueListStateImpl(
      issues: null == issues
          ? _value._issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<IssueModel>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IssueListStateImpl implements _IssueListState {
  const _$IssueListStateImpl(
      {final List<IssueModel> issues = const [],
      this.filter = 'open',
      this.isLoading = false,
      this.error})
      : _issues = issues;

  final List<IssueModel> _issues;
  @override
  @JsonKey()
  List<IssueModel> get issues {
    if (_issues is EqualUnmodifiableListView) return _issues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_issues);
  }

  @override
  @JsonKey()
  final String filter;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'IssueListState(issues: $issues, filter: $filter, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssueListStateImpl &&
            const DeepCollectionEquality().equals(other._issues, _issues) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_issues), filter, isLoading, error);

  /// Create a copy of IssueListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IssueListStateImplCopyWith<_$IssueListStateImpl> get copyWith =>
      __$$IssueListStateImplCopyWithImpl<_$IssueListStateImpl>(
          this, _$identity);
}

abstract class _IssueListState implements IssueListState {
  const factory _IssueListState(
      {final List<IssueModel> issues,
      final String filter,
      final bool isLoading,
      final String? error}) = _$IssueListStateImpl;

  @override
  List<IssueModel> get issues;
  @override
  String get filter;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of IssueListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IssueListStateImplCopyWith<_$IssueListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
