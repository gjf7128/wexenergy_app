import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wexenergy_app/models/address.dart';
import 'package:wexenergy_app/models/date.dart';
import 'package:wexenergy_app/models/room.dart';
part 'building.g.dart';

@JsonSerializable()
class Building extends Equatable {
  final Address address;
  final Date visitDate;
  final String propertyType;
  final Date constructionDate;
  final Date? conversionDate;
  final double squareFeet;
  final List<Room> rooms;
  final int windowCount;
  final String buildingNotes;

  const Building(
      {required this.address,
      required this.visitDate,
      required this.propertyType,
      required this.constructionDate,
      required this.conversionDate,
      required this.squareFeet,
      required this.rooms,
      required this.windowCount,
      required this.buildingNotes});

  Building copyWith(
          {Address? address,
          Date? visitDate,
          String? propertyType,
          Date? constructionDate,
          Date? conversionDate,
          double? squareFeet,
          List<Room>? rooms,
          int? windowCount,
          String? buildingNotes}) =>
      Building(
          address: address ?? this.address,
          visitDate: visitDate ?? this.visitDate,
          propertyType: propertyType ?? this.propertyType,
          constructionDate: constructionDate ?? this.constructionDate,
          conversionDate: conversionDate ?? this.conversionDate,
          squareFeet: squareFeet ?? this.squareFeet,
          rooms: rooms ?? this.rooms,
          windowCount: windowCount ?? this.windowCount,
          buildingNotes: buildingNotes ?? this.buildingNotes);

  factory Building.fromJson(Map<String, dynamic> json) =>
      _$BuildingFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingToJson(this);

  @override
  List<Object?> get props => [
        address,
        visitDate,
        propertyType,
        constructionDate,
        conversionDate,
        squareFeet,
        rooms,
        windowCount,
        buildingNotes
      ];
}
