// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  Board get board => throw _privateConstructorUsedError;
  String get game_state => throw _privateConstructorUsedError;
  String get host_name => throw _privateConstructorUsedError;
  String? get guest_name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {Board board,
      String game_state,
      String host_name,
      String? guest_name,
      String id,
      String name});

  $BoardCopyWith<$Res> get board;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? game_state = null,
    Object? host_name = null,
    Object? guest_name = freezed,
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board,
      game_state: null == game_state
          ? _value.game_state
          : game_state // ignore: cast_nullable_to_non_nullable
              as String,
      host_name: null == host_name
          ? _value.host_name
          : host_name // ignore: cast_nullable_to_non_nullable
              as String,
      guest_name: freezed == guest_name
          ? _value.guest_name
          : guest_name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BoardCopyWith<$Res> get board {
    return $BoardCopyWith<$Res>(_value.board, (value) {
      return _then(_value.copyWith(board: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
          _$SessionImpl value, $Res Function(_$SessionImpl) then) =
      __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Board board,
      String game_state,
      String host_name,
      String? guest_name,
      String id,
      String name});

  @override
  $BoardCopyWith<$Res> get board;
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
      _$SessionImpl _value, $Res Function(_$SessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? game_state = null,
    Object? host_name = null,
    Object? guest_name = freezed,
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$SessionImpl(
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board,
      game_state: null == game_state
          ? _value.game_state
          : game_state // ignore: cast_nullable_to_non_nullable
              as String,
      host_name: null == host_name
          ? _value.host_name
          : host_name // ignore: cast_nullable_to_non_nullable
              as String,
      guest_name: freezed == guest_name
          ? _value.guest_name
          : guest_name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionImpl implements _Session {
  _$SessionImpl(
      {required this.board,
      required this.game_state,
      required this.host_name,
      required this.guest_name,
      required this.id,
      required this.name});

  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);

  @override
  final Board board;
  @override
  final String game_state;
  @override
  final String host_name;
  @override
  final String? guest_name;
  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'Session(board: $board, game_state: $game_state, host_name: $host_name, guest_name: $guest_name, id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.game_state, game_state) ||
                other.game_state == game_state) &&
            (identical(other.host_name, host_name) ||
                other.host_name == host_name) &&
            (identical(other.guest_name, guest_name) ||
                other.guest_name == guest_name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, board, game_state, host_name, guest_name, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionImplToJson(
      this,
    );
  }
}

abstract class _Session implements Session {
  factory _Session(
      {required final Board board,
      required final String game_state,
      required final String host_name,
      required final String? guest_name,
      required final String id,
      required final String name}) = _$SessionImpl;

  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;

  @override
  Board get board;
  @override
  String get game_state;
  @override
  String get host_name;
  @override
  String? get guest_name;
  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
