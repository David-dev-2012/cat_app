import 'dart:async';

import 'package:cat_app/core/get_it_manager/setup_features.dart';
import 'package:cat_app/domain/entities/breed_entity.dart';
import 'package:cat_app/domain/entities/fact_entitiy.dart';
import 'package:cat_app/domain/usecase/get_breeds_usecase.dart';
import 'package:cat_app/domain/usecase/get_facts_usecase.dart';

class CatsState {
  final bool loadingFact;
  final bool loadingBreeds;
  final FactEntitiy? fact;
  final List<BreedEntity>? breeds;
  final String? error;

  const CatsState({
    this.loadingFact = false,
    this.loadingBreeds = false,
    this.fact,
    this.breeds,
    this.error,
  });

  CatsState copyWith({
    bool? loadingFact,
    bool? loadingBreeds,
    FactEntitiy? fact,
    List<BreedEntity>? breeds,
    String? error,
    bool clearError = false,
  }) {
    return CatsState(
      loadingFact: loadingFact ?? this.loadingFact,
      loadingBreeds: loadingBreeds ?? this.loadingBreeds,
      fact: fact ?? this.fact,
      breeds: breeds ?? this.breeds,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class CatsController {
  late final GetFactsUseCase _getFactsUseCase;
  late final GetBreedsUseCase _getBreedsUseCase;
  late final StreamController<CatsState> _controller;

  CatsState state = const CatsState();

  Stream<CatsState> get stream => _controller.stream;

  void init() {
    _getFactsUseCase = setup<GetFactsUseCase>();
    _getBreedsUseCase = setup<GetBreedsUseCase>();
    _controller = StreamController<CatsState>.broadcast();
    _emit(state);
  }

  void _emit(CatsState newState) {
    state = newState;
    _controller.add(state);
  }

  Future<void> showFact() async {
    _emit(state.copyWith(loadingFact: true, clearError: true));
    try {
      final fact = await _getFactsUseCase();
      _emit(state.copyWith(loadingFact: false, fact: fact, clearError: true));
    } catch (e) {
      _emit(state.copyWith(loadingFact: false, error: e.toString()));
    }
  }

  Future<void> showBreeds() async {
    _emit(state.copyWith(loadingBreeds: true, clearError: true));
    try {
      final breeds = await _getBreedsUseCase();
      _emit(state.copyWith(
        loadingBreeds: false,
        breeds: breeds,
        clearError: true,
      ));
    } catch (e) {
      _emit(state.copyWith(loadingBreeds: false, error: e.toString()));
    }
  }

  void dispose() {
    _controller.close();
  }
}
