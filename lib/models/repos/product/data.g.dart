// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['product_id'] as int,
    json['product_name'] as String,
    json['price1'],
    json['pic_url'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'price1': instance.price,
      'pic_url': instance.picUrl,
      'description': instance.description,
    };
