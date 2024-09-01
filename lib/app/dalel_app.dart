
import 'package:flutter/material.dart';

import '../core/routes/app_router.dart';
import '../core/utils/app_colors.dart';

class Dalel extends StatelessWidget {
  Dalel({super.key});
  final ThemeData theme = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.offWhite),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}