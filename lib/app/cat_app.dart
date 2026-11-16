import 'package:cat_app/app/routes.dart';
import 'package:cat_app/core/resources/app_strings.dart';
import 'package:cat_app/presentation/screens/cats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner:  false,
          title: AppStrings.appTitle,
          initialRoute: AppRoutes.cats,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case AppRoutes.cats:
                return MaterialPageRoute(
                  builder: (_) => const CatsScreen(),
                  settings: settings,
                  
                );
              default:
                return MaterialPageRoute(
                  builder: (_) => const Scaffold(
                    body: Center(child: Text(AppStrings.routeNotFound)),
                  ),
                  settings: settings,
                );
            }
          },
        );
      },
    );
  }
}
