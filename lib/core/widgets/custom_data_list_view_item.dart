import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:mydalil3/features/home/data/models/Wars_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/home/data/models/historical_periods_model.dart';
import '../models/data_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomDataListViewItem extends StatelessWidget {
  const CustomDataListViewItem(
      {super.key, required this.model});
  final  DataModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 10,
                  offset: const Offset(0, 7))
            ]),
        width: 164,
        height: 96,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 15),
            SizedBox(
              height: 48,
              width: 65,
              child: Text(
                model.name,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: CustomTextStyles.poppins500style18.copyWith(
                  fontSize: 13,
                  color: AppColors.deepBrown,
                ),
              ),
            ),
            SizedBox(
              height: 64,
              width: 47,
              child: CachedNetworkImage(
                imageUrl: model.image,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: AppColors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 47,
                    height: 64,
                    color: AppColors.grey,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}