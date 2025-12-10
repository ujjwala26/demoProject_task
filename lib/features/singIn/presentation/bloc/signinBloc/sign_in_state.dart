part of 'sign_in_bloc.dart';


abstract class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  // final String message;

  // SignInSuccess(this.message);
  final String otp;

  //final int phoneNumber;

//final String orgId;

//final String  email;
final String userName;

  var enteredOtp;
  SignInSuccess({ required this.userName, required this.otp,} );


}

final class SignInFailure extends SignInState {
  final String message;
  SignInFailure(this.message);
}
