part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class SignInButtonPressed extends SignInEvent {
  // final String userName;
  // final String email;
  // final String password;
  final String email;
  final String phoneNumber;
  final String orgId;

  SignInButtonPressed({
   required this.email, 
    required this.phoneNumber,
    required this.orgId, 
  }
//     this.userName,
//     this.password,
//     );
// }
  );
}
