import 'package:flutter/material.dart';

class Room {
  String roomTypeName;

  Room({required this.roomTypeName});
}

enum RoomType {
  bedroom,
  livingRoom,
  kitchen,
  office,
  bathroom,
}

class Unit {
  String unitName;
  int roomCount;
  List<Room> rooms;

  Unit({required this.unitName, required this.roomCount, required this.rooms});
}

