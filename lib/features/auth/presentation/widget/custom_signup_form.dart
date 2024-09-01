
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydalil3/features/auth/presentation/widget/terms_and_conditions_widget.dart';


import '../../../../core/functions/custom_toast.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app-string.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubit/cubit_cubit.dart';
import '../auth_cubit/cubit_state.dart';
import 'custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cCustomSignUpForm extends StatelessWidget {
  const cCustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState){
          showToast('Successfully,Check your email to verfiy your account');
          customNavigateReplacement(context, "/Signinview");

        }else if (state is SignupFailerState){
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
            key: authCubit.signupFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: AppStrings.fristName,
                  onChanged: (fristName) {
                    authCubit.fristName = fristName;
                  },
                ),
                CustomTextFormField(
                  labelText: AppStrings.lastName,
                  onChanged: (lastName) {
                    authCubit.lastName = lastName;
                  },
                ),
                CustomTextFormField(
                    labelText: AppStrings.emailAddress,
                    onChanged: (emailAddress) {
                      authCubit.emailAddress = emailAddress;
                    }),
                CustomTextFormField(
                  labelText: AppStrings.password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      authCubit.obscurePasswordTextValue == true
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      authCubit.obscurePasswordText();
                    },
                  ),
                  obscureText: authCubit.obscurePasswordTextValue,
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                ),
                TermsAndConditionsWidget(),
                SizedBox(
                  height: 88,
                ),
                state is SignupLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomBtn(
                        color: authCubit.termsAndcondtionCheckBoxValue == false
                            ? AppColors.grey
                            : null,
                        text: AppStrings.signUp,
                        onPressed: () async{
                          if (authCubit.termsAndcondtionCheckBoxValue == true) {
                            if (authCubit.signupFormKey.currentState!
                                .validate()) {
                              await authCubit.signUpWithEmailAndPassword();
                            }
                          }
                        },
                      ),
              ],
            ));
      },
    );
  }
}
