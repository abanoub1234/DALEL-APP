import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app-string.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomHomeViewAppBar extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Assets.imagesMenu),
        Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64.copyWith(fontSize: 22),
        ),
      ],
    );
  }

}