// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chit.controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChitControllerState {
  ControllerState<dynamic> get createChit => throw _privateConstructorUsedError;
  ControllerState<dynamic> get editChit => throw _privateConstructorUsedError;
  ControllerState<dynamic> get deleteChit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChitControllerStateCopyWith<ChitControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChitControllerStateCopyWith<$Res> {
  factory $ChitControllerStateCopyWith(
          ChitControllerState value, $Res Function(ChitControllerState) then) =
      _$ChitControllerStateCopyWithImpl<$Res, ChitControllerState>;
  @useResult
  $Res call(
      {ControllerState<dynamic> createChit,
      ControllerState<dynamic> editChit,
      ControllerState<dynamic> deleteChit});

  $ControllerStateCopyWith<dynamic, $Res> get createChit;
  $ControllerStateCopyWith<dynamic, $Res> get editChit;
  $ControllerStateCopyWith<dynamic, $Res> get deleteChit;
}

/// @nodoc
class _$ChitControllerStateCopyWithImpl<$Res, $Val extends ChitControllerState>
    implements $ChitControllerStateCopyWith<$Res> {
  _$ChitControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createChit = null,
    Object? editChit = null,
    Object? deleteChit = null,
  }) {
    return _then(_value.copyWith(
      createChit: null == createChit
          ? _value.createChit
          : createChit // ignore: cast_nullable_to_non_nullable
              as ControllerState<dynamic>,
      editChit: null == editChit
          ? _value.editChit
          : editChit // ignore: cast_nullable_to_non_nullable
              as ControllerState<dynamic>,
      deleteChit: null == deleteChit
          ? _value.deleteChit
          : deleteChit // ignore: cast_nullable_to_non_nullable
              as ControllerState<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ControllerStateCopyWith<dynamic, $Res> get createChit {
    return $ControllerStateCopyWith<dynamic, $Res>(_value.createChit, (value) {
      return _then(_value.copyWith(createChit: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ControllerStateCopyWith<dynamic, $Res> get editChit {
    return $ControllerStateCopyWith<dynamic, $Res>(_value.editChit, (value) {
      return _then(_value.copyWith(editChit: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ControllerStateCopyWith<dynamic, $Res> get deleteChit {
    return $ControllerStateCopyWith<dynamic, $Res>(_value.deleteChit, (value) {
      return _then(_value.copyWith(deleteChit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$$ChitControllerStateImplCopyWith<$Res>
    implements $ChitControllerStateCopyWith<$Res> {
  factory _$$$ChitControllerStateImplCopyWith(_$$ChitControllerStateImpl value,
          $Res Function(_$$ChitControllerStateImpl) then) =
      __$$$ChitControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ControllerState<dynamic> createChit,
      ControllerState<dynamic> editChit,
      ControllerState<dynamic> deleteChit});

  @override
  $ControllerStateCopyWith<dynamic, $Res> get createChit;
  @override
  $ControllerStateCopyWith<dynamic, $Res> get editChit;
  @override
  $ControllerStateCopyWith<dynamic, $Res> get deleteChit;
}

/// @nodoc
class __$$$ChitControllerStateImplCopyWithImpl<$Res>
    extends _$ChitControllerStateCopyWithImpl<$Res, _$$ChitControllerStateImpl>
    implements _$$$ChitControllerStateImplCopyWith<$Res> {
  __$$$ChitControllerStateImplCopyWithImpl(_$$ChitControllerStateImpl _value,
      $Res Function(_$$ChitControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createChit = null,
    Object? editChit = null,
    Object? deleteChit = null,
  }) {
    return _then(_$$ChitControllerStateImpl(
      createChit: null == createChit
          ? _value.createChit
          : createChit // ignore: cast_nullable_to_non_nullable
              as ControllerState<dynamic>,
      editChit: null == editChit
          ? _value.editChit
          : editChit // ignore: cast_nullable_to_non_nullable
              as ControllerState<dynamic>,
      deleteChit: null == deleteChit
          ? _value.deleteChit
          : deleteChit // ignore: cast_nullable_to_non_nullable
              as ControllerState<dynamic>,
    ));
  }
}

/// @nodoc

class _$$ChitControllerStateImpl implements $ChitControllerState {
  const _$$ChitControllerStateImpl(
      {this.createChit = const ControllerState(),
      this.editChit = const ControllerState(),
      this.deleteChit = const ControllerState()});

  @override
  @JsonKey()
  final ControllerState<dynamic> createChit;
  @override
  @JsonKey()
  final ControllerState<dynamic> editChit;
  @override
  @JsonKey()
  final ControllerState<dynamic> deleteChit;

  @override
  String toString() {
    return 'ChitControllerState(createChit: $createChit, editChit: $editChit, deleteChit: $deleteChit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ChitControllerStateImpl &&
            (identical(other.createChit, createChit) ||
                other.createChit == createChit) &&
            (identical(other.editChit, editChit) ||
                other.editChit == editChit) &&
            (identical(other.deleteChit, deleteChit) ||
                other.deleteChit == deleteChit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, createChit, editChit, deleteChit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$ChitControllerStateImplCopyWith<_$$ChitControllerStateImpl>
      get copyWith =>
          __$$$ChitControllerStateImplCopyWithImpl<_$$ChitControllerStateImpl>(
              this, _$identity);
}

abstract class $ChitControllerState implements ChitControllerState {
  const factory $ChitControllerState(
      {final ControllerState<dynamic> createChit,
      final ControllerState<dynamic> editChit,
      final ControllerState<dynamic> deleteChit}) = _$$ChitControllerStateImpl;

  @override
  ControllerState<dynamic> get createChit;
  @override
  ControllerState<dynamic> get editChit;
  @override
  ControllerState<dynamic> get deleteChit;
  @override
  @JsonKey(ignore: true)
  _$$$ChitControllerStateImplCopyWith<_$$ChitControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
