import 'package:cat_app/domain/entities/breed_entity.dart';
import 'package:cat_app/domain/entities/fact_entitiy.dart';

abstract class CatRepository {
  Future<FactEntitiy> getFacts();
  Future<List<BreedEntity>> getBreeds();
}
