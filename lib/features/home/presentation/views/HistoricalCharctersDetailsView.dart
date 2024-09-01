import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_colors.dart';

import '../../data/models/historical_charcters_model.dart';

import '../widget/PeriodDetailsSection.dart';

import '../widget/home_sections/home_app_bar_section.dart';

class Historicalcharctersdetailsview extends StatelessWidget {
   Historicalcharctersdetailsview({super.key, required this.model, });
  final HistoricalCharctersModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: AppColors.deepBrown,),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: HomeAppBarSection()),
              SliverToBoxAdapter(child: SizedBox(height: 7)),
              SliverToBoxAdapter(
                  child: PeriodDetailsSection(
                    periodName: model.name,
                    description: model.discription,
                    imageUrl: model.image,
                  )),




            ],
          ),
        ));
  }
}
