import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wexenergy_app/models/clearance.dart';
import 'package:wexenergy_app/models/frame_type.dart';
import 'package:wexenergy_app/models/orientation.dart';
import 'package:wexenergy_app/models/pane.dart';

//TODO: (gjf7128): Uncomment part 'customer.g.dart' and fromJson and toJson below and then run
// 'dart run build_runner build --delete-conflicting-outputs' in the terminal
// once children classes are defined.
// part 'window.g.dart';

@JsonSerializable()
class Window extends Equatable {
  final FrameType frameType;
  final Orientation orientation;
  final Clearance clearance;
  final List<Pane> panes;

  const Window(
      {required this.frameType,
      required this.orientation,
      required this.clearance,
      required this.panes});

  Window copyWith(
          {FrameType? frameType,
          Orientation? orientation,
          Clearance? clearance,
          List<Pane>? panes}) =>
      Window(
          frameType: frameType ?? this.frameType,
          orientation: orientation ?? this.orientation,
          clearance: clearance ?? this.clearance,
          panes: panes ?? this.panes);

//
  // factory Window.fromJson(Map<String, dynamic> json) =>
  //     _$WindowFromJson(json);

  // Map<String, dynamic> toJson() => _$WindowFromJson(this);

  @override
  List<Object?> get props => [frameType, orientation, clearance, panes];
}
