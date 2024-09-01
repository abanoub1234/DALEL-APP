

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app-string.dart';
import '../widget/custom_forgot_password_form.dart';
import '../widget/forgot_password_image.dart';
import '../widget/forgot_password_sub_title.dart';
import '../widget/welcome_text_widget.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 108)),
          SliverToBoxAdapter(
              child: welcomeTextWidget(text: AppStrings.forgotPassword)),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: ForgotPasswrodImage()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: ForgotPasswordSubTitle()),
          SliverToBoxAdapter(child: CustomForgotPasswrodForm()),
        ],
      ),
    );
  }
}