import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// Portfolio project synchronized with the Django REST Framework API.
///
/// Field names follow the ProjectSerializer in main/serializers.py:
/// technology, project_url, and thumbnail.
@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  const Project({
    required this.title,
    required this.description,
    required this.technology,
    required this.projectUrl,
    this.thumbnail = '',
    this.id,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;

  final String title;
  final String description;
  final String technology;
  final String projectUrl;

  @JsonKey(defaultValue: '')
  final String thumbnail;

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}