// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Window _$WindowFromJson(Map<String, dynamic> json) => Window(
      frameType: $enumDecode(_$FrameTypeEnumMap, json['frameType']),
      orientation: $enumDecode(_$OrientationEnumMap, json['orientation']),
      clearance: $enumDecode(_$ClearanceEnumMap, json['clearance']),
      panes: (json['panes'] as List<dynamic>)
          .map((e) => Pane.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WindowToJson(Window instance) => <String, dynamic>{
      'frameType': _$FrameTypeEnumMap[instance.frameType]!,
      'orientation': _$OrientationEnumMap[instance.orientation]!,
      'clearance': _$ClearanceEnumMap[instance.clearance]!,
      'panes': instance.panes,
    };

const _$FrameTypeEnumMap = {
  FrameType.fixed: 'fixed',
  FrameType.doubleHung: 'doubleHung',
  FrameType.doubleHungPair: 'doubleHungPair',
  FrameType.slider: 'slider',
  FrameType.tripleSlider: 'tripleSlider',
  FrameType.complex: 'complex',
};

const _$OrientationEnumMap = {
  Orientation.north: 'north',
  Orientation.northEast: 'northEast',
  Orientation.east: 'east',
  Orientation.southEast: 'southEast',
  Orientation.south: 'south',
  Orientation.southWest: 'southWest',
  Orientation.west: 'west',
  Orientation.northWest: 'northWest',
};

const _$ClearanceEnumMap = {
  Clearance.high: 'high',
  Clearance.low: 'low',
  Clearance.none: 'none',
};
