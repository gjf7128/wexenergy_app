import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wexenergy_app/models/skin_type.dart';

//TODO: (gjf7128): Uncomment part 'customer.g.dart' and fromJson and toJson below and then run
// 'dart run build_runner build --delete-conflicting-outputs' in the terminal
// once children classes are defined.
// part 'pane.g.dart';

@JsonSerializable()
class Pane extends Equatable {
  final int paneId;
  final SkinType skinType;
  final double height;
  final double width;

  const Pane(
      {required this.paneId,
      required this.skinType,
      required this.height,
      required this.width});

  Pane copyWith(
          {int? paneId, SkinType? skinType, double? height, double? width}) =>
      Pane(
          paneId: paneId ?? this.paneId,
          skinType: skinType ?? this.skinType,
          height: height ?? this.height,
          width: width ?? this.width);

//
  // factory Pane.fromJson(Map<String, dynamic> json) =>
  //     _$PaneFromJson(json);

  // Map<String, dynamic> toJson() => _$PaneFromJson(this);

  @override
  List<Object?> get props => [paneId, skinType, height, width];
}
