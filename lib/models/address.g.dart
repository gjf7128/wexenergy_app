// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      streetNumber: json['streetNumber'] as int,
      streetName: json['streetName'] as String,
      streetSuffix: json['streetSuffix'] as String,
      apartmentNumber: json['apartmentNumber'] as String?,
      addressState: json['addressState'] as String,
      zipCode: json['zipCode'] as int,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'streetNumber': instance.streetNumber,
      'streetName': instance.streetName,
      'streetSuffix': instance.streetSuffix,
      'apartmentNumber': instance.apartmentNumber,
      'addressState': instance.addressState,
      'zipCode': instance.zipCode,
    };
