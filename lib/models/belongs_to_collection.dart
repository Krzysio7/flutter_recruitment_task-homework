import 'package:json_annotation/json_annotation.dart';

part 'belongs_to_collection.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BelongsToCollection {
  final int id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}
