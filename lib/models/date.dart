import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

//TODO: (gjf7128): Uncomment part 'customer.g.dart' and fromJson and toJson below and then run
// 'dart run build_runner build --delete-conflicting-outputs' in the terminal
// once children classes are defined.
// part 'date.g.dart';

@JsonSerializable()
class Date extends Equatable {
  final int month;
  final int day;
  final int year;

  const Date({required this.month, required this.day, required this.year});

  Date copyWith({int? month, int? day, int? year}) => Date(
      month: month ?? this.month,
      day: day ?? this.day,
      year: year ?? this.year);

//
  // factory Date.fromJson(Map<String, dynamic> json) =>
  //     _$DateFromJson(json);

  // Map<String, dynamic> toJson() => _$DateFromJson(this);

  @override
  List<Object?> get props => [month, day, year];
}
