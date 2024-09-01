import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../search/presentation/views/search_view.dart';

import '../cubit/home_cubit.dart';
import '../views/HomeView.dart';

class HomeNavBarWidget extends StatelessWidget {
  PersistentTabController _controller = PersistentTabController();

  HomeNavBarWidget({super.key});

  List<Widget> _buildScreens() {
    return [

      BlocProvider(
        create: (context) =>
        HomeCubit()
          ..getHistorivalperiods()
          ..getHistorivalcharacters()
          ..getHistoricalSouvenirs(),
        child: HomeView(),
      ),
      BlocProvider(
        create: (context) =>  HomeCubit()
          ..getHistorivalcharacters()

        ,
        child: SearchView(),
      ),
      ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [

      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesHomeIconActive),
        inactiveIcon: SvgPicture.asset(Assets.imagesHomeIcon),
        activeColorPrimary: AppColors.offWhite,

      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesSearchActive),
        inactiveIcon: SvgPicture.asset(Assets.imagesSearch),
        activeColorPrimary: AppColors.offWhite,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesPersonActive),
        inactiveIcon: SvgPicture.asset(Assets.imagesPerson),
        activeColorPrimary: AppColors.offWhite,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),

      controller: _controller,
      backgroundColor: AppColors.primaryColor,
      navBarStyle: NavBarStyle.style10,
      decoration: NavBarDecoration(

        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
    );
  }
}
