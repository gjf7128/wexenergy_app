import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

//TODO: (gjf7128): Uncomment part 'customer.g.dart' and fromJson and toJson below and then run
// 'dart run build_runner build --delete-conflicting-outputs' in the terminal
// once children classes are defined.
// part 'quote.g.dart';

@JsonSerializable()
class Quote extends Equatable {
  final String recommendation;
  final String optionsSummary;
  final String skinDistribution;
  final double totalCost;
  final int simplePayback;
  final double netCashFlow;

  const Quote(
      {required this.recommendation,
      required this.optionsSummary,
      required this.skinDistribution,
      required this.totalCost,
      required this.simplePayback,
      required this.netCashFlow});

  Quote copyWith(
          {String? recommendation,
          String? optionsSummary,
          String? skinDistribution,
          double? totalCost,
          int? simplePayback,
          double? netCashFlow}) =>
      Quote(
          recommendation: recommendation ?? this.recommendation,
          optionsSummary: optionsSummary ?? this.optionsSummary,
          skinDistribution: skinDistribution ?? this.skinDistribution,
          totalCost: totalCost ?? this.totalCost,
          simplePayback: simplePayback ?? this.simplePayback,
          netCashFlow: netCashFlow ?? this.netCashFlow);

//
  // factory Quote.fromJson(Map<String, dynamic> json) =>
  //     _$QuoteFromJson(json);

  // Map<String, dynamic> toJson() => _$QuoteFromJson(this);

  @override
  List<Object?> get props => [
        recommendation,
        optionsSummary,
        skinDistribution,
        totalCost,
        simplePayback,
        netCashFlow
      ];
}
