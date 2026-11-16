import 'package:cat_app/core/resources/app_strings.dart';
import 'package:cat_app/core/utils/app_size.dart';
import 'package:cat_app/presentation/controller/cats_controller.dart';
import 'package:cat_app/presentation/widget/breeds_section.dart';
import 'package:cat_app/presentation/widget/cats_action_buttons.dart';
import 'package:cat_app/presentation/widget/cats_empty_state.dart';
import 'package:cat_app/presentation/widget/cats_error_message.dart';
import 'package:cat_app/presentation/widget/fact_section.dart';
import 'package:flutter/material.dart';

class CatsScreen extends StatefulWidget {
  const CatsScreen({super.key});

  @override
  State<CatsScreen> createState() => _CatsScreenState();
}

class _CatsScreenState extends State<CatsScreen> {
  late final CatsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CatsController();
    _controller.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CatsState>(
      stream: _controller.stream,
      initialData: _controller.state,
      builder: (context, snapshot) {
        final state = snapshot.data ?? _controller.state;
        return Scaffold(
          appBar: AppBar(title: const Text(AppStrings.catsTitle)),
          body: Padding(
            padding: EdgeInsets.all(AppWidth.w16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CatsActionButtons(
                  loadingFact: state.loadingFact,
                  loadingBreeds: state.loadingBreeds,
                  onShowFact: _controller.showFact,
                  onShowBreeds: _controller.showBreeds,
                ),
                SizedBox(height: AppHeight.h16),
                if (state.error != null)
                  CatsErrorMessage(message: state.error!),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (state.fact != null) FactSection(fact: state.fact!),
                        if (state.breeds != null)
                          BreedsSection(breeds: state.breeds!),
                        if (state.fact == null &&
                            state.breeds == null &&
                            state.error == null)
                          const CatsEmptyState(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
