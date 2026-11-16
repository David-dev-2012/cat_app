import 'package:cat_app/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CatsErrorMessage extends StatelessWidget {
  final String message;

  const CatsErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppHeight.h12),
      child: Text(
        message,
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
