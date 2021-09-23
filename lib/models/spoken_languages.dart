import 'package:json_annotation/json_annotation.dart';

part 'spoken_languages.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpokenLanguages {
  final String? iso31661;
  final String? name;

  SpokenLanguages({
    required this.iso31661,
    required this.name,
  });

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);
}
