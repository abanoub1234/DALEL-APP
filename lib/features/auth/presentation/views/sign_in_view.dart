import 'package:flutter/material.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app-string.dart';
import '../widget/custom_siggning_form.dart';
import '../../../../core/widgets/welcome_banner.dart';
import '../widget/have_an_account_widget.dart';
import '../widget/welcome_text_widget.dart';

class Signinview extends StatelessWidget {
  const Signinview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics:BouncingScrollPhysics() ,
        slivers: [
          SliverToBoxAdapter(
            child: WelcomBanner(),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 32)),
          SliverToBoxAdapter(
            child: welcomeTextWidget(
              text: AppStrings.welcomeBack,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: CustomSignInForm(),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),

          SliverToBoxAdapter(
            child: HaveAnAccountWidget(
              text1: AppStrings.dontHaveAnAccount,
              text2: AppStrings.signUp,
              onTap: (){
                customNavigateReplacement(context, '/SignUpView');
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
