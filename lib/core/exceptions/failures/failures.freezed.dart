// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailed,
    required TResult Function() timeout,
    required TResult Function() internetOut,
    required TResult Function() invalidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailed,
    TResult? Function()? timeout,
    TResult? Function()? internetOut,
    TResult? Function()? invalidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailed,
    TResult Function()? timeout,
    TResult Function()? internetOut,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailed value) serverFailed,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_InternetOut value) internetOut,
    required TResult Function(_invalidCredential value) invalidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailed value)? serverFailed,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_InternetOut value)? internetOut,
    TResult? Function(_invalidCredential value)? invalidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailed value)? serverFailed,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_InternetOut value)? internetOut,
    TResult Function(_invalidCredential value)? invalidToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiFailureCopyWith<$Res> {
  factory $ApiFailureCopyWith(
          ApiFailure value, $Res Function(ApiFailure) then) =
      _$ApiFailureCopyWithImpl<$Res, ApiFailure>;
}

/// @nodoc
class _$ApiFailureCopyWithImpl<$Res, $Val extends ApiFailure>
    implements $ApiFailureCopyWith<$Res> {
  _$ApiFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerFailedImplCopyWith<$Res> {
  factory _$$ServerFailedImplCopyWith(
          _$ServerFailedImpl value, $Res Function(_$ServerFailedImpl) then) =
      __$$ServerFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerFailedImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$ServerFailedImpl>
    implements _$$ServerFailedImplCopyWith<$Res> {
  __$$ServerFailedImplCopyWithImpl(
      _$ServerFailedImpl _value, $Res Function(_$ServerFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerFailedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerFailedImpl implements _ServerFailed {
  const _$ServerFailedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ApiFailure.serverFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailedImplCopyWith<_$ServerFailedImpl> get copyWith =>
      __$$ServerFailedImplCopyWithImpl<_$ServerFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailed,
    required TResult Function() timeout,
    required TResult Function() internetOut,
    required TResult Function() invalidToken,
  }) {
    return serverFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailed,
    TResult? Function()? timeout,
    TResult? Function()? internetOut,
    TResult? Function()? invalidToken,
  }) {
    return serverFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailed,
    TResult Function()? timeout,
    TResult Function()? internetOut,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (serverFailed != null) {
      return serverFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailed value) serverFailed,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_InternetOut value) internetOut,
    required TResult Function(_invalidCredential value) invalidToken,
  }) {
    return serverFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailed value)? serverFailed,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_InternetOut value)? internetOut,
    TResult? Function(_invalidCredential value)? invalidToken,
  }) {
    return serverFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailed value)? serverFailed,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_InternetOut value)? internetOut,
    TResult Function(_invalidCredential value)? invalidToken,
    required TResult orElse(),
  }) {
    if (serverFailed != null) {
      return serverFailed(this);
    }
    return orElse();
  }
}

abstract class _ServerFailed implements ApiFailure {
  const factory _ServerFailed({required final String message}) =
      _$ServerFailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ServerFailedImplCopyWith<_$ServerFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutImplCopyWith<$Res> {
  factory _$$TimeoutImplCopyWith(
          _$TimeoutImpl value, $Res Function(_$TimeoutImpl) then) =
      __$$TimeoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimeoutImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$TimeoutImpl>
    implements _$$TimeoutImplCopyWith<$Res> {
  __$$TimeoutImplCopyWithImpl(
      _$TimeoutImpl _value, $Res Function(_$TimeoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimeoutImpl implements _Timeout {
  const _$TimeoutImpl();

  @override
  String toString() {
    return 'ApiFailure.timeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimeoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailed,
    required TResult Function() timeout,
    required TResult Function() internetOut,
    required TResult Function() invalidToken,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailed,
    TResult? Function()? timeout,
    TResult? Function()? internetOut,
    TResult? Function()? invalidToken,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailed,
    TResult Function()? timeout,
    TResult Function()? internetOut,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailed value) serverFailed,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_InternetOut value) internetOut,
    required TResult Function(_invalidCredential value) invalidToken,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailed value)? serverFailed,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_InternetOut value)? internetOut,
    TResult? Function(_invalidCredential value)? invalidToken,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailed value)? serverFailed,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_InternetOut value)? internetOut,
    TResult Function(_invalidCredential value)? invalidToken,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class _Timeout implements ApiFailure {
  const factory _Timeout() = _$TimeoutImpl;
}

/// @nodoc
abstract class _$$InternetOutImplCopyWith<$Res> {
  factory _$$InternetOutImplCopyWith(
          _$InternetOutImpl value, $Res Function(_$InternetOutImpl) then) =
      __$$InternetOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternetOutImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$InternetOutImpl>
    implements _$$InternetOutImplCopyWith<$Res> {
  __$$InternetOutImplCopyWithImpl(
      _$InternetOutImpl _value, $Res Function(_$InternetOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InternetOutImpl implements _InternetOut {
  const _$InternetOutImpl();

  @override
  String toString() {
    return 'ApiFailure.internetOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InternetOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailed,
    required TResult Function() timeout,
    required TResult Function() internetOut,
    required TResult Function() invalidToken,
  }) {
    return internetOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailed,
    TResult? Function()? timeout,
    TResult? Function()? internetOut,
    TResult? Function()? invalidToken,
  }) {
    return internetOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailed,
    TResult Function()? timeout,
    TResult Function()? internetOut,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (internetOut != null) {
      return internetOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailed value) serverFailed,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_InternetOut value) internetOut,
    required TResult Function(_invalidCredential value) invalidToken,
  }) {
    return internetOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailed value)? serverFailed,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_InternetOut value)? internetOut,
    TResult? Function(_invalidCredential value)? invalidToken,
  }) {
    return internetOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailed value)? serverFailed,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_InternetOut value)? internetOut,
    TResult Function(_invalidCredential value)? invalidToken,
    required TResult orElse(),
  }) {
    if (internetOut != null) {
      return internetOut(this);
    }
    return orElse();
  }
}

abstract class _InternetOut implements ApiFailure {
  const factory _InternetOut() = _$InternetOutImpl;
}

/// @nodoc
abstract class _$$invalidCredentialImplCopyWith<$Res> {
  factory _$$invalidCredentialImplCopyWith(_$invalidCredentialImpl value,
          $Res Function(_$invalidCredentialImpl) then) =
      __$$invalidCredentialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$invalidCredentialImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$invalidCredentialImpl>
    implements _$$invalidCredentialImplCopyWith<$Res> {
  __$$invalidCredentialImplCopyWithImpl(_$invalidCredentialImpl _value,
      $Res Function(_$invalidCredentialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$invalidCredentialImpl implements _invalidCredential {
  const _$invalidCredentialImpl();

  @override
  String toString() {
    return 'ApiFailure.invalidToken()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$invalidCredentialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailed,
    required TResult Function() timeout,
    required TResult Function() internetOut,
    required TResult Function() invalidToken,
  }) {
    return invalidToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailed,
    TResult? Function()? timeout,
    TResult? Function()? internetOut,
    TResult? Function()? invalidToken,
  }) {
    return invalidToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailed,
    TResult Function()? timeout,
    TResult Function()? internetOut,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (invalidToken != null) {
      return invalidToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailed value) serverFailed,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_InternetOut value) internetOut,
    required TResult Function(_invalidCredential value) invalidToken,
  }) {
    return invalidToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailed value)? serverFailed,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_InternetOut value)? internetOut,
    TResult? Function(_invalidCredential value)? invalidToken,
  }) {
    return invalidToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailed value)? serverFailed,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_InternetOut value)? internetOut,
    TResult Function(_invalidCredential value)? invalidToken,
    required TResult orElse(),
  }) {
    if (invalidToken != null) {
      return invalidToken(this);
    }
    return orElse();
  }
}

abstract class _invalidCredential implements ApiFailure {
  const factory _invalidCredential() = _$invalidCredentialImpl;
}
