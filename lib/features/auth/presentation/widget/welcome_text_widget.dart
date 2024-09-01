import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class welcomeTextWidget extends StatelessWidget {
  const welcomeTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(text,
        style: CustomTextStyles.pacifico600style28,
      ),
    );
  }
}