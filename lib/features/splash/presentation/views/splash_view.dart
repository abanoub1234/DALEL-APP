import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app-string.dart';
import '../../../../core/utils/app_text_styles.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: 'isOnBoardingVisited') ?? false;
    if (isOnBoardingVisited == true) {
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigate(context, "/Signinview")
          : FirebaseAuth.instance.currentUser!.emailVerified == true
          ? delayedNavigate(context, "/homeNavBar")
          : delayedNavigate(context, "/Signinview");
    } else {
      delayedNavigate(context, "/onBoarding");
    }

    super.initState();
  }

  void delayedNavigate(context, String path) {
    Future.delayed(Duration(seconds: 2), () {
      customNavigateReplacement(context, path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(AppStrings.appName,
              style: CustomTextStyles.pacifico400style64)),
    );
  }
}
