import 'package:json_annotation/json_annotation.dart';

part 'production_countries.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCountries {
  final String? iso31661;
  final String? name;

  ProductionCountries({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}
