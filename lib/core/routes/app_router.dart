

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../../features/auth/presentation/auth_cubit/cubit_cubit.dart';
import '../../features/auth/presentation/views/ForgotPasswordView.dart';
import '../../features/auth/presentation/views/sign_in_view.dart';

import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/home/data/models/historical_charcters_model.dart';
import '../../features/home/data/models/historical_periods_model.dart';
import '../../features/home/data/models/historical_souvenirs_model.dart';
import '../../features/home/presentation/views/HistoricalCharctersDetailsView.dart';
import '../../features/home/presentation/views/HistoricalPeriodsDetailsView.dart';
import '../../features/home/presentation/views/HistoricalSouvenirsDetailsView.dart';
import '../../features/home/presentation/views/HomeView.dart';
import '../../features/home/presentation/widget/home_nav_bar_widget.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

//SHA1: 8E:CA:77:C0:CC:EF:4C:79:C1:C0:69:7B:B1:DF:DD:F8:24:74:93:EC
// SHA-256: A2:AB:3C:C9:CC:1B:D8:EA:E3:C8:B7:BD:EF:D3:36:1E:9F:D7:0E:BD:31:3D:C8:89:82:E6:8E:1B:55:22:38:A6

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, stat) => SplashView(),
    ),
    GoRoute(
      path: "/onBoarding",
      builder: (context, state) => OnBoardingView(),
    ),
    GoRoute(
        path: "/SignUpView",
        builder: (context, state) => BlocProvider(
              create: (context) => AuthCubit(),
              child:  SignUpView(),
            )),
    GoRoute(
      path: "/Signinview",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child:  Signinview(),
      ),
    ),
    GoRoute(
      path: "/forgotPassword",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child:   ForgotPasswordView(),
      ),
    ),
    GoRoute(
      path: "/homeNavBar",
      builder: (context, state) => HomeNavBarWidget(),
    ),
    GoRoute(
        path: "/home",
        builder: (context, state) => HomeView(),
    ),

    GoRoute(
      path: "/historicalPeriodsDetailsView",
      builder: (context, state) => HistoricalPeriodsDetailsView(
          model: state.extra as HistoricalPeriodsModel),
    ),
    GoRoute(
      path: "/HistoricalCharctersDetailsView",
      builder: (context, state) => Historicalcharctersdetailsview(
          model: state.extra as HistoricalCharctersModel,
        ),
    ),
    GoRoute(
      path: "/HistoricalSouvenirsDetailsView",
      builder: (context, state) => HistoricalSouvenirsDetailsView(
          models: state.extra as HistoricalSouvenirsModel
      ),
    ),
  ],
);


