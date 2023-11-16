// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pane.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pane _$PaneFromJson(Map<String, dynamic> json) => Pane(
      paneId: json['paneId'] as int,
      skinType: $enumDecode(_$SkinTypeEnumMap, json['skinType']),
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
    );

Map<String, dynamic> _$PaneToJson(Pane instance) => <String, dynamic>{
      'paneId': instance.paneId,
      'skinType': _$SkinTypeEnumMap[instance.skinType]!,
      'height': instance.height,
      'width': instance.width,
    };

const _$SkinTypeEnumMap = {
  SkinType.solar: 'solar',
  SkinType.polar: 'polar',
};
