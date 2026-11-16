// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedModel _$BreedModelFromJson(Map<String, dynamic> json) => BreedModel(
  breed: json['breed'] as String,
  country: json['country'] as String,
  origin: json['origin'] as String,
  coat: json['coat'] as String,
  pattern: json['pattern'] as String,
);

Map<String, dynamic> _$BreedModelToJson(BreedModel instance) =>
    <String, dynamic>{
      'breed': instance.breed,
      'country': instance.country,
      'origin': instance.origin,
      'coat': instance.coat,
      'pattern': instance.pattern,
    };
