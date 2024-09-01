import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/custom_toast.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'custom_category_list_view_item.dart';

class CustomCategoryListView extends StatelessWidget {
  CustomCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      if (state is GetHistoricalCharactersFailur) {
        showToast(state.errMessage);
      }},

      builder: (context, state) {
        return SizedBox(
          height: 133,
          child: ListView.separated(
            clipBehavior: Clip.none,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(width: 16);
            },
            scrollDirection: Axis.horizontal,
            itemCount:  context.read<HomeCubit>().historicalcharacters.length,
            itemBuilder: (_, index) {
              return CustomCategoryListViewItem(
              charctersModel: context.read<HomeCubit>().historicalcharacters[index],
              routerpath: "/HistoricalCharctersDetailsView",
              );
            },
          ),
        );
      },
    );
  }
}