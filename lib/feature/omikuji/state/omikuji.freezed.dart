// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'omikuji.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Omikuji {
  OmikujiResult? get result => throw _privateConstructorUsedError;

  /// Create a copy of Omikuji
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OmikujiCopyWith<Omikuji> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OmikujiCopyWith<$Res> {
  factory $OmikujiCopyWith(Omikuji value, $Res Function(Omikuji) then) =
      _$OmikujiCopyWithImpl<$Res, Omikuji>;
  @useResult
  $Res call({OmikujiResult? result});
}

/// @nodoc
class _$OmikujiCopyWithImpl<$Res, $Val extends Omikuji>
    implements $OmikujiCopyWith<$Res> {
  _$OmikujiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Omikuji
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as OmikujiResult?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OmikujiImplCopyWith<$Res> implements $OmikujiCopyWith<$Res> {
  factory _$$OmikujiImplCopyWith(
          _$OmikujiImpl value, $Res Function(_$OmikujiImpl) then) =
      __$$OmikujiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OmikujiResult? result});
}

/// @nodoc
class __$$OmikujiImplCopyWithImpl<$Res>
    extends _$OmikujiCopyWithImpl<$Res, _$OmikujiImpl>
    implements _$$OmikujiImplCopyWith<$Res> {
  __$$OmikujiImplCopyWithImpl(
      _$OmikujiImpl _value, $Res Function(_$OmikujiImpl) _then)
      : super(_value, _then);

  /// Create a copy of Omikuji
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$OmikujiImpl(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as OmikujiResult?,
    ));
  }
}

/// @nodoc

class _$OmikujiImpl implements _Omikuji {
  const _$OmikujiImpl({this.result});

  @override
  final OmikujiResult? result;

  @override
  String toString() {
    return 'Omikuji(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OmikujiImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of Omikuji
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OmikujiImplCopyWith<_$OmikujiImpl> get copyWith =>
      __$$OmikujiImplCopyWithImpl<_$OmikujiImpl>(this, _$identity);
}

abstract class _Omikuji implements Omikuji {
  const factory _Omikuji({final OmikujiResult? result}) = _$OmikujiImpl;

  @override
  OmikujiResult? get result;

  /// Create a copy of Omikuji
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OmikujiImplCopyWith<_$OmikujiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
