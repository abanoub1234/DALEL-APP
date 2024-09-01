
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/historical_periods_model.dart';

class HistoricalPeriodItem extends StatelessWidget {
   HistoricalPeriodItem({super.key, required this.model,this.routerpath});
  String? routerpath;
  final HistoricalPeriodsModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        customNavigate(context,routerpath!,extra:model );
      },
      child: Container(
        width: 164,
        height: 96,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 10,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 16,
            ),
            SizedBox(
              height: 48,
              width: 64,
              child: Text(
                model.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: CustomTextStyles.poppins500style18
                    .copyWith(fontSize: 13, color: AppColors.deepBrown),
              ),
            ),
            Container(
                height: 64,
                width: 47,
                child: CachedNetworkImage(

                  imageUrl:model.image,

                  placeholder:(context,url)=> Shimmer.fromColors(
                    baseColor: AppColors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      width: 47,
                      height: 64,
                      color: AppColors.grey,
                    ),
                  ),

                  errorWidget:(context,url,error)=>Icon(Icons.error) ,
                ),
               ),
            SizedBox(
              width: 16,
            )
          ],
        ),
      ),
    );
  }
}
