// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volumes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumesResponseDTO _$VolumesResponseDTOFromJson(Map<String, dynamic> json) {
  return VolumesResponseDTO(
    kind: json['kind'] as String,
    volumes: (json['items'] as List<dynamic>)
        .map((e) => Volume.fromJson(e as Map<String, dynamic>))
        .toList(),
    total: json['totalItems'] as int,
  );
}

Map<String, dynamic> _$VolumesResponseDTOToJson(VolumesResponseDTO instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'items': instance.volumes,
      'totalItems': instance.total,
    };
