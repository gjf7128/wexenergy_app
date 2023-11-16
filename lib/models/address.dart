import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';

@JsonSerializable()
class Address extends Equatable {
  final int streetNumber;
  final String streetName;
  final String streetSuffix;
  final String? apartmentNumber;
  final String addressState;
  final int zipCode;

  const Address(
      {required this.streetNumber,
      required this.streetName,
      required this.streetSuffix,
      required this.apartmentNumber,
      required this.addressState,
      required this.zipCode});

  Address copyWith(
          {int? streetNumber,
          String? streetName,
          String? streetSuffix,
          String? apartmentNumber,
          String? addressState,
          int? zipCode}) =>
      Address(
          streetNumber: streetNumber ?? this.streetNumber,
          streetName: streetName ?? this.streetName,
          streetSuffix: streetSuffix ?? this.streetSuffix,
          apartmentNumber: apartmentNumber ?? this.apartmentNumber,
          addressState: addressState ?? this.addressState,
          zipCode: zipCode ?? this.zipCode);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object?> get props => [
        streetNumber,
        streetName,
        streetSuffix,
        apartmentNumber,
        addressState,
        zipCode
      ];
}
