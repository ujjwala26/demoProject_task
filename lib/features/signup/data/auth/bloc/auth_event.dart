part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}
class SaveUserData extends AuthEvent {
  final String token;
  final int userId;
  final String userName;

  SaveUserData({
    required this.token,
    required this.userId,
    required this.userName,
  });
}