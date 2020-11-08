import 'package:json_annotation/json_annotation.dart';
import 'package:liveeasy_huynl/models/repos/product/data.dart';
import 'package:liveeasy_huynl/models/repos/product/metadata.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  final Metadata metadata;
  final Data data;

  Product(this.metadata, this.data);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
