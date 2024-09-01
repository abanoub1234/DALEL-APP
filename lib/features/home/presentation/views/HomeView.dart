import 'package:flutter/material.dart';
import '../widget/home_sections/historical_characters_section.dart';
import '../widget/home_sections/historical_periods_section.dart';
import '../widget/home_sections/historical_souvenirs_section.dart';
import '../widget/home_sections/home_app_bar_section.dart';

class HomeView extends StatelessWidget
{
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
       padding:  EdgeInsets.symmetric(horizontal: 15),
       child: CustomScrollView(
         physics: BouncingScrollPhysics(),
         slivers: [
           SliverToBoxAdapter(child: HomeAppBarSection(),),
           SliverToBoxAdapter(child: HistoricalPeriodsSection(),),
           SliverToBoxAdapter(child: HistoricalCharactersSection(),),
           SliverToBoxAdapter(child: HistoricalSouvenirsSection(),),
         ],
       ),
     )
    );
  }
}















