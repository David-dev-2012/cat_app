import 'package:cat_app/core/resources/app_strings.dart';
import 'package:cat_app/core/utils/app_size.dart';
import 'package:cat_app/domain/entities/fact_entitiy.dart';
import 'package:flutter/material.dart';

class FactSection extends StatelessWidget {
  final FactEntitiy fact;

  const FactSection({super.key, required this.fact});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.fact,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: AppHeight.h8),
        Card(
          child: Padding(
            padding: EdgeInsets.all(AppWidth.w12),
            child: Text(fact.fact),
          ),
        ),
        SizedBox(height: AppHeight.h16),
      ],
    );
  }
}
