
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_data_list_view_item.dart';
import '../../../auth/presentation/widget/period_wars_section.dart';
import '../../data/models/historical_periods_model.dart';
import '../widget/PeriodDetailsSection.dart';

import '../widget/home_sections/historical_characters_section.dart';
import '../widget/home_sections/home_app_bar_section.dart';




class HistoricalPeriodsDetailsView extends StatelessWidget {
   HistoricalPeriodsDetailsView({super.key, required this.model});
  final HistoricalPeriodsModel model;
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
             SliverToBoxAdapter(child: SizedBox(height: 120)),
              SliverToBoxAdapter(child: PeriodWarsSection(warsList: model.wars,)),


            ],
          ),
        ));
  }
}

