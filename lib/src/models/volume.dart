import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volume.g.dart';

@JsonSerializable()
class Volume extends Equatable {
  final String? id;
  @JsonKey(name: 'volumeInfo')
  final _VolumeInfo? info;
  @JsonKey(name: 'saleInfo')
  final _SaleInfo? sale;

  const Volume({required this.id, required this.info, required this.sale});

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);

  @override
  List<Object?> get props => [id, info, sale];

  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}

@JsonSerializable()
class _VolumeInfo extends Equatable {
  final String? title;
  final String? subtitle;
  final List<String>? authors;
  final String? description;
  @JsonKey(name: 'imageLinks')
  final _ImageLinks? links;

  const _VolumeInfo(
      {required this.title,
      required this.subtitle,
      required this.authors,
      required this.description,
      required this.links});

  factory _VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$_VolumeInfoFromJson(json);

  @override
  List<Object?> get props => [title, subtitle, authors, description, links];

  Map<String, dynamic> toJson() => _$_VolumeInfoToJson(this);
}

@JsonSerializable()
class _ImageLinks extends Equatable {
  final String? thumbnail;
  final String? large;

  const _ImageLinks({required this.thumbnail, required this.large});

  factory _ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$_ImageLinksFromJson(json);

  @override
  List<Object?> get props => [thumbnail, large];

  Map<String, dynamic> toJson() => _$_ImageLinksToJson(this);
}

@JsonSerializable()
class _SaleInfo extends Equatable {
  @JsonKey(name: 'retailPrice')
  final _RetailPrice? price;

  const _SaleInfo({required this.price});

  factory _SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$_SaleInfoFromJson(json);

  @override
  List<Object?> get props => [price];

  Map<String, dynamic> toJson() => _$_SaleInfoToJson(this);
}

@JsonSerializable()
class _RetailPrice extends Equatable {
  final double? amount;
  final String? currencyCode;

  const _RetailPrice({required this.amount, required this.currencyCode});

  factory _RetailPrice.fromJson(Map<String, dynamic> json) =>
      _$_RetailPriceFromJson(json);

  @override
  List<Object?> get props => [amount, currencyCode];

  Map<String, dynamic> toJson() => _$_RetailPriceToJson(this);
}
