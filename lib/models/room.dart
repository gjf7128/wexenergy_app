import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wexenergy_app/models/window.dart';
part 'room.g.dart';

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

  const Room.initialize()
      : roomType = '',
        floorLevel = 0,
        windows = const [],
        roomNotes = '',
        roomId = 0;

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

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);

  @override
  List<Object?> get props => [roomType, floorLevel, windows, roomNotes, roomId];
}
