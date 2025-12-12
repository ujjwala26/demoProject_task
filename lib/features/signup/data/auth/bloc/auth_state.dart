part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class userVerifiedSuccessfully extends AuthState {
  final String? token;
  final int? userId;
  final String? userName;
  final bool isNewUser;

  userVerifiedSuccessfully ({
    this.token, 
    this.userId, 
    this.userName, 
    this.isNewUser=false,
  }
    );
    userVerifiedSuccessfully copyWith({
      String? token,
    int? userId,
    String? userName,
    bool? isNewUser,

    }){
      return userVerifiedSuccessfully(
        token: token ?? this.token,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      isNewUser: isNewUser ?? this.isNewUser,
      );
    }
    

}
