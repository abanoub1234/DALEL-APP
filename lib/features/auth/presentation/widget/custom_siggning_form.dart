

import 'package:flutter/material.dart';

import '../../../../core/functions/custom_toast.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app-string.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubit/cubit_cubit.dart';
import '../auth_cubit/cubit_state.dart';
import 'custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/utils/app_colors.dart';
import 'forgot_password_text_widget.dart';


class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninSuccessState){
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customNavigateReplacement(context, "/homeNavBar")
              : showToast("Please Verify Your Account");

        }else if (state is SigninFailureState){
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.signinFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                  labelText: AppStrings.emailAddress,
                  onChanged: (emailAddress) {
                    authCubit.emailAddress= emailAddress;
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
              SizedBox(height: 16,),
              ForgotPasswordTextWidget(),
              SizedBox(
                height: 102,
              ),
              state is SigninLoadingState
                  ? CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomBtn(
                  text:AppStrings.signIn,
                      onPressed: () async{

                          if (authCubit.signinFormKey.currentState!
                              .validate()) {

                           await authCubit.sigInWithEmailAndPassword();

                          }
                        },
              ),

            ],
          ),
        );
      },
    );
  }
}
