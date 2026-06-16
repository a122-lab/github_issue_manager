// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IssueDetailState {
  IssueModel get issue => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IssueDetailStateCopyWith<IssueDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssueDetailStateCopyWith<$Res> {
  factory $IssueDetailStateCopyWith(
          IssueDetailState value, $Res Function(IssueDetailState) then) =
      _$IssueDetailStateCopyWithImpl<$Res, IssueDetailState>;
  @useResult
  $Res call({IssueModel issue, bool isUpdating, String? error});

  $IssueModelCopyWith<$Res> get issue;
}

/// @nodoc
class _$IssueDetailStateCopyWithImpl<$Res, $Val extends IssueDetailState>
    implements $IssueDetailStateCopyWith<$Res> {
  _$IssueDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issue = null,
    Object? isUpdating = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      issue: null == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as IssueModel,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueModelCopyWith<$Res> get issue {
    return $IssueModelCopyWith<$Res>(_value.issue, (value) {
      return _then(_value.copyWith(issue: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IssueDetailStateImplCopyWith<$Res>
    implements $IssueDetailStateCopyWith<$Res> {
  factory _$$IssueDetailStateImplCopyWith(_$IssueDetailStateImpl value,
          $Res Function(_$IssueDetailStateImpl) then) =
      __$$IssueDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IssueModel issue, bool isUpdating, String? error});

  @override
  $IssueModelCopyWith<$Res> get issue;
}

/// @nodoc
class __$$IssueDetailStateImplCopyWithImpl<$Res>
    extends _$IssueDetailStateCopyWithImpl<$Res, _$IssueDetailStateImpl>
    implements _$$IssueDetailStateImplCopyWith<$Res> {
  __$$IssueDetailStateImplCopyWithImpl(_$IssueDetailStateImpl _value,
      $Res Function(_$IssueDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issue = null,
    Object? isUpdating = null,
    Object? error = freezed,
  }) {
    return _then(_$IssueDetailStateImpl(
      issue: null == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as IssueModel,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IssueDetailStateImpl implements _IssueDetailState {
  const _$IssueDetailStateImpl(
      {required this.issue, this.isUpdating = false, this.error});

  @override
  final IssueModel issue;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  final String? error;

  @override
  String toString() {
    return 'IssueDetailState(issue: $issue, isUpdating: $isUpdating, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssueDetailStateImpl &&
            (identical(other.issue, issue) || other.issue == issue) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, issue, isUpdating, error);

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IssueDetailStateImplCopyWith<_$IssueDetailStateImpl> get copyWith =>
      __$$IssueDetailStateImplCopyWithImpl<_$IssueDetailStateImpl>(
          this, _$identity);
}

abstract class _IssueDetailState implements IssueDetailState {
  const factory _IssueDetailState(
      {required final IssueModel issue,
      final bool isUpdating,
      final String? error}) = _$IssueDetailStateImpl;

  @override
  IssueModel get issue;
  @override
  bool get isUpdating;
  @override
  String? get error;

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IssueDetailStateImplCopyWith<_$IssueDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
