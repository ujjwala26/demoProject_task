part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class SignInButtonPressed extends SignInEvent {
  final String username;
  //final String email;
  final String password;

  SignInButtonPressed(
    //this.email, 
    this.username,
    this.password,
    );
}


