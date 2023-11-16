// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      roomType: json['roomType'] as String,
      floorLevel: json['floorLevel'] as int,
      windows: (json['windows'] as List<dynamic>)
          .map((e) => Window.fromJson(e as Map<String, dynamic>))
          .toList(),
      roomNotes: json['roomNotes'] as String,
      roomId: json['roomId'] as int,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'roomType': instance.roomType,
      'floorLevel': instance.floorLevel,
      'windows': instance.windows,
      'roomNotes': instance.roomNotes,
      'roomId': instance.roomId,
    };
