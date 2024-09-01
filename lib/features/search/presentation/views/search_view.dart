import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/custom_toast.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../home/presentation/cubit/home_state.dart';
import '../../../home/presentation/widget/custom_category_list_view_item.dart';


class SearchView extends StatelessWidget {
  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                context.read<HomeCubit>().filterCharacters(value);
              },
              decoration: InputDecoration(
                hintText: 'Search Characters',
                prefixIcon: Icon(Icons.search,color: AppColors.primaryColor,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: AppColors.deepBrown
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is GetHistoricalCharactersFailur) {
                  showToast(state.errMessage);
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(60,8,60,8),
                    child: ListView.separated(

                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16);
                      },
                      scrollDirection: Axis.vertical,
                      itemCount: context.read<HomeCubit>().filteredCharacters.length,
                      itemBuilder: (_, index) {
                        return CustomCategoryListViewItem(
                          charctersModel: context.read<HomeCubit>().filteredCharacters[index],
                          routerpath: "/HistoricalCharctersDetailsView",
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
      
      
        ],
      ),
    );
  }
}
