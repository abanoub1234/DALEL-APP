import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app-string.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_header_text.dart';

class PeriodDetailsSection extends StatelessWidget {
  const PeriodDetailsSection(
      {super.key,
        required this.periodName,
        required this.description,
        required this.imageUrl});
  final String periodName;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomHeaderText(text: "${AppStrings.about} $periodName"),
            const SizedBox(width: 7),

          ],
        ),
        const SizedBox(height: 47),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                    width: 196,
                    height: 200,
                    child: Text(
                      description,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.poppins500style18
                          .copyWith(color: AppColors.black),
                    )),
              ],
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 131,
              height: 200,
              child: CachedNetworkImage(imageUrl: imageUrl),
            )
          ],
        )
      ],
    );
  }
}