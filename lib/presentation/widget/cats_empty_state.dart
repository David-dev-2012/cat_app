import 'package:cat_app/core/resources/app_strings.dart';
import 'package:cat_app/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CatsEmptyState extends StatelessWidget {
  const CatsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: AppHeight.h32),
        child: const Text(AppStrings.emptyStateMessage),
      ),
    );
  }
}
