// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Volume _$VolumeFromJson(Map<String, dynamic> json) {
  return Volume(
    id: json['id'] as String?,
    info: json['volumeInfo'] == null
        ? null
        : _VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    sale: json['saleInfo'] == null
        ? null
        : _SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VolumeToJson(Volume instance) => <String, dynamic>{
      'id': instance.id,
      'volumeInfo': instance.info,
      'saleInfo': instance.sale,
    };

_VolumeInfo _$_VolumeInfoFromJson(Map<String, dynamic> json) {
  return _VolumeInfo(
    title: json['title'] as String?,
    subtitle: json['subtitle'] as String?,
    authors:
        (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    description: json['description'] as String?,
    links: json['imageLinks'] == null
        ? null
        : _ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_VolumeInfoToJson(_VolumeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'description': instance.description,
      'imageLinks': instance.links,
    };

_ImageLinks _$_ImageLinksFromJson(Map<String, dynamic> json) {
  return _ImageLinks(
    thumbnail: json['thumbnail'] as String?,
    large: json['large'] as String?,
  );
}

Map<String, dynamic> _$_ImageLinksToJson(_ImageLinks instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'large': instance.large,
    };

_SaleInfo _$_SaleInfoFromJson(Map<String, dynamic> json) {
  return _SaleInfo(
    price: json['retailPrice'] == null
        ? null
        : _RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_SaleInfoToJson(_SaleInfo instance) => <String, dynamic>{
      'retailPrice': instance.price,
    };

_RetailPrice _$_RetailPriceFromJson(Map<String, dynamic> json) {
  return _RetailPrice(
    amount: (json['amount'] as num?)?.toDouble(),
    currencyCode: json['currencyCode'] as String?,
  );
}

Map<String, dynamic> _$_RetailPriceToJson(_RetailPrice instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
    };
