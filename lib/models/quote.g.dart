// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      recommendation: json['recommendation'] as String,
      optionsSummary: json['optionsSummary'] as String,
      skinDistribution: json['skinDistribution'] as String,
      totalCost: (json['totalCost'] as num).toDouble(),
      simplePayback: json['simplePayback'] as int,
      netCashFlow: (json['netCashFlow'] as num).toDouble(),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'recommendation': instance.recommendation,
      'optionsSummary': instance.optionsSummary,
      'skinDistribution': instance.skinDistribution,
      'totalCost': instance.totalCost,
      'simplePayback': instance.simplePayback,
      'netCashFlow': instance.netCashFlow,
    };
