part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpbuttonPressed extends SignUpEvent{

  final String firstname;
  final String lastname;
  final String age;
  final String email;
  final String username ;
  final String password;


  SignUpbuttonPressed(this.username, this.lastname, this.firstname, this.age, this.email, this.password);

}


