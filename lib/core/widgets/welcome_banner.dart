import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app-string.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class WelcomBanner extends StatelessWidget {
  const WelcomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            AppStrings.appName,
            style: CustomTextStyles.pacifico400style64,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(Assets.imagesVector2),
              SvgPicture.asset(Assets.imagesVector1),
            ],
          )
        ],
      ),
    );
  }
}