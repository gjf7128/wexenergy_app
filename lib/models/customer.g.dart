// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      email: json['email'] as String,
      buildings: (json['buildings'] as List<dynamic>)
          .map((e) => Building.fromJson(e as Map<String, dynamic>))
          .toList(),
      buildingCount: json['buildingCount'] as int,
      quote: Quote.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'email': instance.email,
      'buildings': instance.buildings,
      'buildingCount': instance.buildingCount,
      'quote': instance.quote,
    };
