import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'date.g.dart';

@JsonSerializable()
class Date extends Equatable {
  final int month;
  final int day;
  final int year;

  const Date({required this.month, required this.day, required this.year});

  const Date.initialize()
      : month = 0,
        day = 0,
        year = 0;

  Date copyWith({int? month, int? day, int? year}) => Date(
      month: month ?? this.month,
      day: day ?? this.day,
      year: year ?? this.year);

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);

  @override
  List<Object?> get props => [month, day, year];
}
