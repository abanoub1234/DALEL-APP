import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/historical_charcters_model.dart';

class CustomCategoryListViewItem extends StatelessWidget {
   CustomCategoryListViewItem({super.key,required this.charctersModel,this.routerpath});

   HistoricalCharctersModel charctersModel;
   String? routerpath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        customNavigate(context,routerpath!,extra:charctersModel );
      },
      child: Container(
        // width: 74,
        //       height: 150,
        width: 95,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 10,
                  offset: const Offset(0, 7))
            ]),
        child: Column(
          children: [
            Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),

              ),
              width: 80,
              height: 96,
              child: CachedNetworkImage(
                imageUrl: charctersModel.image,
                fit: BoxFit.fill,
                placeholder:(context,url)=> Shimmer.fromColors(
                  baseColor: AppColors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 80,
                    height: 96,
                    color: AppColors.grey,
                  ),
                ),

                errorWidget:(context,url,error)=>Icon(Icons.error) ,
              ),



              ),

            const SizedBox(height: 11),
            Text(

              charctersModel.name,
              style: CustomTextStyles.poppins500style14,
            )
          ],
        ),
      ),
    );
  }
}