import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'product_name')
  final String productName;
  @JsonKey(name: 'price1')
  final dynamic price;
  @JsonKey(name: 'pic_url')
  final String picUrl;
  final String description;

  Data(this.productId, this.productName, this.price, this.picUrl,
      this.description);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
