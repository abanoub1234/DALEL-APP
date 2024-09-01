
import 'package:flutter/material.dart';

import '../../../../core/utils/app-string.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'custom_check_box.dart';

class TermsAndConditionsWidget extends StatelessWidget
{

  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Row(
      children: [
        CustomCheckBox(),
        Text.rich(TextSpan(
          children: [
            TextSpan(
                style: CustomTextStyles.poppins400style12,
                text: AppStrings.iHaveAgreeToOur),
            TextSpan(
                style: CustomTextStyles.poppins400style12.copyWith(decoration: TextDecoration.underline),
                text: AppStrings.termsAndCondition),
          ],
        ))
      ],
    );
  }


}
