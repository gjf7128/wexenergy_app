import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wexenergy_app/models/window.dart';

//TODO: (gjf7128): Uncomment part 'customer.g.dart' and fromJson and toJson below and then run
// 'dart run build_runner build --delete-conflicting-outputs' in the terminal
// once children classes are defined.
// part 'room.g.dart';

@JsonSerializable()
class Room extends Equatable {
  final String roomType;
  final int floorLevel;
  final List<Window> windows;
  final String roomNotes;
  final int roomId;

  const Room(
      {required this.roomType,
      required this.floorLevel,
      required this.windows,
      required this.roomNotes,
      required this.roomId});

  Room copyWith(
          {String? roomType,
          int? floorLevel,
          List<Window>? windows,
          String? roomNotes,
          int? roomId}) =>
      Room(
          roomType: roomType ?? this.roomType,
          floorLevel: floorLevel ?? this.floorLevel,
          windows: windows ?? this.windows,
          roomNotes: roomNotes ?? this.roomNotes,
          roomId: roomId ?? this.roomId);

//
  // factory Room.fromJson(Map<String, dynamic> json) =>
  //     _$RoomFromJson(json);

  // Map<String, dynamic> toJson() => _$RoomFromJson(this);

  @override
  List<Object?> get props => [roomType, floorLevel, windows, roomNotes, roomId];
}
