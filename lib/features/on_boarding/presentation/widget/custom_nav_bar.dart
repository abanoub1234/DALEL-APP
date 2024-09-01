import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app-string.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomNavBar extends StatelessWidget {
   CustomNavBar({super.key,this.ontap});

   final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(AppStrings.skip,style: CustomTextStyles.poppins300style16.copyWith(
            fontWeight: FontWeight.w400
        ),

        ),
      ),
    );
  }
}
