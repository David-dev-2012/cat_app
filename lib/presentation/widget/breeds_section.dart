import 'package:cat_app/core/resources/app_strings.dart';
import 'package:cat_app/core/utils/app_size.dart';
import 'package:cat_app/domain/entities/breed_entity.dart';
import 'package:flutter/material.dart';

class BreedsSection extends StatelessWidget {
  final List<BreedEntity> breeds;

  const BreedsSection({super.key, required this.breeds});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.breeds,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: AppHeight.h8),
        ...breeds.map(
          (b) => Card(
            child: ListTile(
              title: Text(b.breed),
              subtitle: Text(
                '${b.country} • ${b.origin}\nCoat: ${b.coat} • Pattern: ${b.pattern}',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
