// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Building _$BuildingFromJson(Map<String, dynamic> json) => Building(
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      visitDate: Date.fromJson(json['visitDate'] as Map<String, dynamic>),
      propertyType: json['propertyType'] as String,
      constructionDate:
          Date.fromJson(json['constructionDate'] as Map<String, dynamic>),
      conversionDate: json['conversionDate'] == null
          ? null
          : Date.fromJson(json['conversionDate'] as Map<String, dynamic>),
      squareFeet: (json['squareFeet'] as num).toDouble(),
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
      windowCount: json['windowCount'] as int,
      buildingNotes: json['buildingNotes'] as String,
    );

Map<String, dynamic> _$BuildingToJson(Building instance) => <String, dynamic>{
      'address': instance.address,
      'visitDate': instance.visitDate,
      'propertyType': instance.propertyType,
      'constructionDate': instance.constructionDate,
      'conversionDate': instance.conversionDate,
      'squareFeet': instance.squareFeet,
      'rooms': instance.rooms,
      'windowCount': instance.windowCount,
      'buildingNotes': instance.buildingNotes,
    };
