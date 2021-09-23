import 'package:json_annotation/json_annotation.dart';

part 'production_companies.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompanies {
  final int id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompanies({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}
