import 'package:bs_app/src/models/volume.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volumes.g.dart';

@JsonSerializable()
class VolumesResponseDTO extends Equatable {
  final String kind;
  @JsonKey(name: 'items')
  final List<Volume> volumes;
  @JsonKey(name: 'totalItems')
  final int total;

  const VolumesResponseDTO(
      {required this.kind, required this.volumes, required this.total});

  factory VolumesResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$VolumesResponseDTOFromJson(json);

  @override
  List<Object> get props => [kind, volumes, total];

  Map<String, dynamic> toJson() => _$VolumesResponseDTOToJson(this);
}
