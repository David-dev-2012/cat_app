import 'package:cat_app/domain/entities/breed_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed_model.g.dart';

@JsonSerializable()
class BreedModel extends BreedEntity {
  const BreedModel({
    required super.breed,
    required super.country,
    required super.origin,
    required super.coat,
    required super.pattern,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) =>
      _$BreedModelFromJson(json);

  Map<String, dynamic> toJson() => _$BreedModelToJson(this);
}
