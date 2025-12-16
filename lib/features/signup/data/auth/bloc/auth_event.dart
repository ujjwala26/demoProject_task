part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SaveUserData extends AuthEvent {
  final String token;
  final String refreshToken;
  final String userId;
  final String userName;
  final String email;
  final String contactNo;
  final String address;
  final bool isNewUser;

  const SaveUserData({
    required this.token,
    required this.refreshToken,
    required this.userId,
    required this.userName,
    required this.email,
    required this.contactNo,
    required this.address,
    required this.isNewUser,
  });

  @override
  List<Object?> get props =>
      [token, refreshToken, userId, userName, email, contactNo, address, isNewUser];
}
