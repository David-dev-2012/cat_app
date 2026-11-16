import 'package:cat_app/domain/entities/breed_entity.dart';
import 'package:cat_app/domain/repository/cat_repository.dart';

class GetBreedsUseCase {
  final CatRepository cat;
  const GetBreedsUseCase(this.cat);

  Future<List<BreedEntity>> call() => cat.getBreeds();
}
