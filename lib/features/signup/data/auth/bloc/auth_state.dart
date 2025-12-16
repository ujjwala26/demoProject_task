part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class UserVerifiedSuccessfully extends AuthState {
  final String token;
  final String userId;
  final String userName;
  final bool isNewUser;

  const UserVerifiedSuccessfully({
    required this.token,
    required this.userId,
    required this.userName,
    required this.isNewUser,
  });

  @override
  List<Object?> get props => [token, userId, userName, isNewUser];
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
