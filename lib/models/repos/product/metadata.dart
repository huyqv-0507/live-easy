import 'package:json_annotation/json_annotation.dart';
part 'metadata.g.dart';

@JsonSerializable()
class Metadata {
  final int page;
  final int size;
  final int total;

  Metadata(this.page, this.size, this.total);

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
