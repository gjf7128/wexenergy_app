import 'package:equatable/equatable.dart';
import 'package:wexenergy_app/models/building.dart';
import 'package:wexenergy_app/models/quote.dart';
import 'package:json_annotation/json_annotation.dart';

//TODO: (gjf7128): Uncomment part 'customer.g.dart' and fromJson and toJson below and then run
// 'dart run build_runner build --delete-conflicting-outputs' in the terminal
// once children classes are defined.
// part 'customer.g.dart';

@JsonSerializable()
class Customer extends Equatable {
  final String email;
  final List<Building> buildings;
  final int buildingCount;
  final Quote quote;

  const Customer(
      {required this.email,
      required this.buildings,
      required this.buildingCount,
      required this.quote});

  Customer copyWith(
          {String? email,
          List<Building>? buildings,
          int? buildingCount,
          Quote? quote}) =>
      Customer(
          email: email ?? this.email,
          buildings: buildings ?? this.buildings,
          buildingCount: buildingCount ?? this.buildingCount,
          quote: quote ?? this.quote);

//
  // factory Customer.fromJson(Map<String, dynamic> json) =>
  //     _$CustomerFromJson(json);

  // Map<String, dynamic> toJson() => _$CustomerFromJson(this);

  @override
  List<Object> get props => [email, buildings, buildingCount, quote];
}
