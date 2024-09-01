class AuthState {}

final class AuthInitial extends AuthState {}
final class SignupLoadingState extends AuthState {}
final class SignupSuccessState extends AuthState {}
final class SignupFailerState extends AuthState {
  final String errMessage;

  SignupFailerState({required this.errMessage});
}

final class TermsAndConditionUpdateState extends AuthState {}
final class ObscurePasswordTextUpdateState extends AuthState {}
final class SigninLoadingState extends AuthState {}

final class SigninSuccessState extends AuthState {}

final class SigninFailureState extends AuthState {
  final String errMessage;

  SigninFailureState({required this.errMessage});
}
final class ResetPasswordLoadingState extends AuthState {}

final class ResetPasswordSuccessState extends AuthState {}

final class ResetPasswordFailureState extends AuthState {
  final String errMessage;

  ResetPasswordFailureState({required this.errMessage});
}