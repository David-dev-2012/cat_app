import 'package:cat_app/core/resources/app_strings.dart';
import 'package:cat_app/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CatsActionButtons extends StatelessWidget {
  final bool loadingFact;
  final bool loadingBreeds;
  final VoidCallback onShowFact;
  final VoidCallback onShowBreeds;

  const CatsActionButtons({
    super.key,
    required this.loadingFact,
    required this.loadingBreeds,
    required this.onShowFact,
    required this.onShowBreeds,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: loadingFact ? null : onShowFact,
            child: loadingFact
                ? SizedBox(
                    height: AppHeight.h20,
                    width: AppWidth.w20,
                    child: CircularProgressIndicator(
                      strokeWidth: AppWidth.w2,
                    ),
                  )
                : const Text(AppStrings.showFact),
          ),
        ),
        SizedBox(width: AppWidth.w12),
        Expanded(
          child: ElevatedButton(
            onPressed: loadingBreeds ? null : onShowBreeds,
            child: loadingBreeds
                ? SizedBox(
                    height: AppHeight.h20,
                    width: AppWidth.w20,
                    child: CircularProgressIndicator(
                      strokeWidth: AppWidth.w2,
                    ),
                  )
                : const Text(AppStrings.showBreeds),
          ),
        ),
      ],
    );
  }
}
