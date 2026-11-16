import 'package:cat_app/core/DB/api/api_consumer.dart';
import 'package:cat_app/core/DB/api/dio_service.dart';
import 'package:cat_app/data/datasources/cat_remote_data_source.dart';
import 'package:cat_app/data/repository/cat_repository_impl.dart';
import 'package:cat_app/domain/repository/cat_repository.dart';
import 'package:cat_app/domain/usecase/get_breeds_usecase.dart';
import 'package:cat_app/domain/usecase/get_facts_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final setup = GetIt.instance;

void setupFeatures() {
  setup.registerLazySingleton<Dio>(() => Dio());
  setup.registerLazySingleton<ApiConsumer>(() => DioService(setup()));
  setup.registerLazySingleton<BaseCatRemoteDataSource>(
    () => CatRemoteDataSource(apiConsumer: setup()),
  );
  setup.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(remoteDataSource: setup()),
  );
  setup.registerLazySingleton<GetFactsUseCase>(() => GetFactsUseCase(setup()));
  setup.registerLazySingleton<GetBreedsUseCase>(() => GetBreedsUseCase(setup()));
}
