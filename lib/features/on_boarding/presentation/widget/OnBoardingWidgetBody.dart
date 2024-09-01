import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/    models/on_boarding_model.dart';
import 'customSmoothIndicator.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  OnBoardingWidgetBody({super.key,required this.controller,this.onPageChanged});

final Function(int)? onPageChanged;
  PageController  controller ;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: PageView.builder(
        onPageChanged:onPageChanged ,
          physics: BouncingScrollPhysics(),
          controller: controller,
          itemCount: onBoardingData.length,
          itemBuilder: (context, indix) {
            return Column(
              children: [
                Container(
                  height: 290,
                  width: 343,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(onBoardingData[indix].imagePath),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 24,
                ),
                CustomSmoothIndicator(controller: controller),
                SizedBox(
                  height: 32,
                ),
                Text(
                  onBoardingData[indix].title,
                  style: CustomTextStyles.poppins500style24
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  onBoardingData[indix].subTitle,
                  style: CustomTextStyles.poppins300style16,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          }),
    );
  }
}
