import 'package:cat_app/domain/entities/fact_entitiy.dart';
import 'package:cat_app/domain/repository/cat_repository.dart';

class GetFactsUseCase {
  final CatRepository cat;
  const GetFactsUseCase(this.cat);
  Future<FactEntitiy> call() => cat.getFacts();
}
