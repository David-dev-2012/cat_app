import 'package:cat_app/data/datasources/cat_remote_data_source.dart';
import 'package:cat_app/domain/entities/breed_entity.dart';
import 'package:cat_app/domain/entities/fact_entitiy.dart';
import 'package:cat_app/domain/repository/cat_repository.dart';

class CatRepositoryImpl implements CatRepository {
  final BaseCatRemoteDataSource remoteDataSource;

  const CatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<FactEntitiy> getFacts() {
    return remoteDataSource.getFacts();
  }

  @override
  Future<List<BreedEntity>> getBreeds() {
    return remoteDataSource.getBreeds();
  }
}
