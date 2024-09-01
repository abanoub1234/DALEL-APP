import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? fristName;
  String? lastName;
   String? emailAddress;
   String? password;
  bool? obscurePasswordTextValue = true;
   bool?termsAndcondtionCheckBoxValue=false;
   GlobalKey<FormState>signupFormKey=GlobalKey();
   GlobalKey<FormState>signinFormKey=GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  Future<void> signUpWithEmailAndPassword(
      ) async {
    try {
      emit(SignupLoadingState());
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      await addUserProfile();
      await verifyEmail();
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupFailerState(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailerState(errMessage: 'The account already exists for that email.'));
      }
      else if (e.code == 'invalid-email') {
        emit(SignupFailerState(errMessage: 'The email is invalid.'));
      } else {
        emit(SignupFailerState(errMessage: e.code));
      }
    } catch (e) {
      emit(SignupFailerState(errMessage: e.toString()));
    }
  }
 void updateTermsAndcondtionCheckBox({required newValue}){
    termsAndcondtionCheckBoxValue=newValue;
    emit(TermsAndConditionUpdateState());

  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }
  Future<void> sigInWithEmailAndPassword() async {
    try {
      emit(SigninLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SigninSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SigninFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SigninFailureState(
            errMessage: 'Wrong password provided for that user.'));
      } else {
        emit(SigninFailureState(errMessage: 'Check your Email and password!'));
      }
    } catch (e) {
      emit(
        SigninFailureState(
          errMessage: e.toString(),
        ),
      );
    }
  }


  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }


  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errMessage: e.toString()));
    }
  }

  Future<void> addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "email": emailAddress,
      "frist_name": fristName,
      "last_name": lastName,
    });
  }

}
