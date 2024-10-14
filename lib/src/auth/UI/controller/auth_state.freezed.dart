// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get authanticated => throw _privateConstructorUsedError;
  AuthFailure get error => throw _privateConstructorUsedError;
  UserModelInfo get userInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool authanticated,
      AuthFailure error,
      UserModelInfo userInfo});

  $AuthFailureCopyWith<$Res> get error;
  $UserModelInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authanticated = null,
    Object? error = null,
    Object? userInfo = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authanticated: null == authanticated
          ? _value.authanticated
          : authanticated // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AuthFailure,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserModelInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<$Res> get error {
    return $AuthFailureCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelInfoCopyWith<$Res> get userInfo {
    return $UserModelInfoCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool authanticated,
      AuthFailure error,
      UserModelInfo userInfo});

  @override
  $AuthFailureCopyWith<$Res> get error;
  @override
  $UserModelInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authanticated = null,
    Object? error = null,
    Object? userInfo = null,
  }) {
    return _then(_$AuthStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authanticated: null == authanticated
          ? _value.authanticated
          : authanticated // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AuthFailure,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserModelInfo,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl extends _AuthState {
  const _$AuthStateImpl(
      {required this.isLoading,
      required this.authanticated,
      required this.error,
      required this.userInfo})
      : super._();

  @override
  final bool isLoading;
  @override
  final bool authanticated;
  @override
  final AuthFailure error;
  @override
  final UserModelInfo userInfo;

  @override
  String toString() {
    return 'AuthState(isLoading: $isLoading, authanticated: $authanticated, error: $error, userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.authanticated, authanticated) ||
                other.authanticated == authanticated) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, authanticated, error, userInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState extends AuthState {
  const factory _AuthState(
      {required final bool isLoading,
      required final bool authanticated,
      required final AuthFailure error,
      required final UserModelInfo userInfo}) = _$AuthStateImpl;
  const _AuthState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get authanticated;
  @override
  AuthFailure get error;
  @override
  UserModelInfo get userInfo;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WeeksState {
  Week get week => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeeksStateCopyWith<WeeksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeksStateCopyWith<$Res> {
  factory $WeeksStateCopyWith(
          WeeksState value, $Res Function(WeeksState) then) =
      _$WeeksStateCopyWithImpl<$Res, WeeksState>;
  @useResult
  $Res call({Week week, bool selected, bool completed});
}

/// @nodoc
class _$WeeksStateCopyWithImpl<$Res, $Val extends WeeksState>
    implements $WeeksStateCopyWith<$Res> {
  _$WeeksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? selected = null,
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as Week,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeksStateImplCopyWith<$Res>
    implements $WeeksStateCopyWith<$Res> {
  factory _$$WeeksStateImplCopyWith(
          _$WeeksStateImpl value, $Res Function(_$WeeksStateImpl) then) =
      __$$WeeksStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Week week, bool selected, bool completed});
}

/// @nodoc
class __$$WeeksStateImplCopyWithImpl<$Res>
    extends _$WeeksStateCopyWithImpl<$Res, _$WeeksStateImpl>
    implements _$$WeeksStateImplCopyWith<$Res> {
  __$$WeeksStateImplCopyWithImpl(
      _$WeeksStateImpl _value, $Res Function(_$WeeksStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? selected = null,
    Object? completed = null,
  }) {
    return _then(_$WeeksStateImpl(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as Week,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WeeksStateImpl extends _WeeksState {
  const _$WeeksStateImpl(
      {required this.week, required this.selected, required this.completed})
      : super._();

  @override
  final Week week;
  @override
  final bool selected;
  @override
  final bool completed;

  @override
  String toString() {
    return 'WeeksState(week: $week, selected: $selected, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeksStateImpl &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, week, selected, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeksStateImplCopyWith<_$WeeksStateImpl> get copyWith =>
      __$$WeeksStateImplCopyWithImpl<_$WeeksStateImpl>(this, _$identity);
}

abstract class _WeeksState extends WeeksState {
  const factory _WeeksState(
      {required final Week week,
      required final bool selected,
      required final bool completed}) = _$WeeksStateImpl;
  const _WeeksState._() : super._();

  @override
  Week get week;
  @override
  bool get selected;
  @override
  bool get completed;
  @override
  @JsonKey(ignore: true)
  _$$WeeksStateImplCopyWith<_$WeeksStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ValueState {
  Week get week => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueStateCopyWith<ValueState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueStateCopyWith<$Res> {
  factory $ValueStateCopyWith(
          ValueState value, $Res Function(ValueState) then) =
      _$ValueStateCopyWithImpl<$Res, ValueState>;
  @useResult
  $Res call({Week week, String value, bool selected});
}

/// @nodoc
class _$ValueStateCopyWithImpl<$Res, $Val extends ValueState>
    implements $ValueStateCopyWith<$Res> {
  _$ValueStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? value = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as Week,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValueStateImplCopyWith<$Res>
    implements $ValueStateCopyWith<$Res> {
  factory _$$ValueStateImplCopyWith(
          _$ValueStateImpl value, $Res Function(_$ValueStateImpl) then) =
      __$$ValueStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Week week, String value, bool selected});
}

/// @nodoc
class __$$ValueStateImplCopyWithImpl<$Res>
    extends _$ValueStateCopyWithImpl<$Res, _$ValueStateImpl>
    implements _$$ValueStateImplCopyWith<$Res> {
  __$$ValueStateImplCopyWithImpl(
      _$ValueStateImpl _value, $Res Function(_$ValueStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? value = null,
    Object? selected = null,
  }) {
    return _then(_$ValueStateImpl(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as Week,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ValueStateImpl extends _ValueState {
  const _$ValueStateImpl(
      {required this.week, required this.value, required this.selected})
      : super._();

  @override
  final Week week;
  @override
  final String value;
  @override
  final bool selected;

  @override
  String toString() {
    return 'ValueState(week: $week, value: $value, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValueStateImpl &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, week, value, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValueStateImplCopyWith<_$ValueStateImpl> get copyWith =>
      __$$ValueStateImplCopyWithImpl<_$ValueStateImpl>(this, _$identity);
}

abstract class _ValueState extends ValueState {
  const factory _ValueState(
      {required final Week week,
      required final String value,
      required final bool selected}) = _$ValueStateImpl;
  const _ValueState._() : super._();

  @override
  Week get week;
  @override
  String get value;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$ValueStateImplCopyWith<_$ValueStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
