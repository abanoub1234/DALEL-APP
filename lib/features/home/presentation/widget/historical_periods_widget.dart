import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/custom_toast.dart';
import '../../../../core/widgets/custom_shimmer_categore.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'historical_period_item.dart';

class HistoricalPeriods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalPeriodsFailur) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return state is GetHistoricalPeriodsLoading
            ? CustomShimmerCategory()
            : SizedBox(
          height: 96,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 60,
              );
            },
            clipBehavior: Clip.none,
            itemCount: context.read<HomeCubit>().historicalperiods.length,
            itemBuilder: (context, index) {
              return HistoricalPeriodItem(
                model: context.read<HomeCubit>().historicalperiods[index],
                routerpath:"/historicalPeriodsDetailsView"
              );
            },
          ),
        );
      },
    );
  }
}
