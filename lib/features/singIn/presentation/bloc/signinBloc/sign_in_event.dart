// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class SignInButtonPressed extends SignInEvent {
  final String userName;
  // final String email;
  // final String password;
  //final String email;
  //final String phoneNumber;
  final String orgId;
  //final String enteredOtp;


  SignInButtonPressed({
    required this.userName,
    //required this.email,
    //required this.phoneNumber,
    required this.orgId,
    //required this.enteredOtp,

  }
  );
}
 
