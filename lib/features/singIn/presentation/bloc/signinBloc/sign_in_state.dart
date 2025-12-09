part of 'sign_in_bloc.dart';


abstract class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final String message;

  SignInSuccess(this.message);
}

final class SignInFailure extends SignInState {
  final String message;
  SignInFailure(this.message);
}
