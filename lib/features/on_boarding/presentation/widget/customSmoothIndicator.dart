import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_colors.dart';

class CustomSmoothIndicator extends StatelessWidget {
  CustomSmoothIndicator({super.key,required this.controller});
 final  PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,  // PageController
      count:  3,
      effect:  ExpandingDotsEffect(activeDotColor: AppColors.deepBrown,
        dotHeight: 7,
        dotWidth: 10,),

    );

  }
}