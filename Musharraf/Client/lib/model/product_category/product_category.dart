import 'package:json_annotation/json_annotation.dart';

part 'product_category.g.dart';

@JsonSerializable()
class ProductCategory {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  ProductCategory({
    this.id,
    this.name,
  });

  // Factory method to create an instance from JSON
  factory ProductCategory.fromJson(Map<String, dynamic> json) => _$ProductCategoryFromJson(json);

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}
