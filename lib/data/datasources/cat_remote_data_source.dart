import 'package:cat_app/core/DB/api/api_consumer.dart';
import 'package:cat_app/core/resources/api_consts.dart';
import 'package:cat_app/data/models/breed_model.dart';
import 'package:cat_app/data/models/fact_model.dart';
import 'package:cat_app/domain/entities/breed_entity.dart';
import 'package:cat_app/domain/entities/fact_entitiy.dart';

abstract class BaseCatRemoteDataSource {
  Future<FactEntitiy> getFacts();
  Future<List<BreedEntity>> getBreeds();
}

class CatRemoteDataSource implements BaseCatRemoteDataSource {
  final ApiConsumer apiConsumer;
  const CatRemoteDataSource({required this.apiConsumer});

  @override
  Future<FactEntitiy> getFacts() async {
    final res = await apiConsumer.get(ApiConsts.factsEndpoint);
    return FactModel.fromJson(res as Map<String, dynamic>);
  }

  @override
  Future<List<BreedEntity>> getBreeds() async {
    final res = await apiConsumer.get(ApiConsts.breedsEndpoint);
    final data = res as Map<String, dynamic>;
    final list = data['data'] as List<dynamic>? ?? [];
    return list
        .map((e) => BreedModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}