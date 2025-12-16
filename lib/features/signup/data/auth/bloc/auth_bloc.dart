import 'package:bloc/bloc.dart';
import 'package:demoproject/core/shared_pref.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SaveUserData>((event , emit )async{
      try{
        emit(AuthLoading());

        await AppPrefs.saveLoginData(
          accessToken: event.token,
          refreshToken: event.refreshToken,
          userId: event.userId,
          userName: event.userName,
          email: event.email,
          contactNo: event.contactNo,
          address: event.address,
        );

      
      emit(UserVerifiedSuccessfully(
        token: event.token,
        userId: event.userId,
        userName: event.userName,
        isNewUser: true,
      ));

      }catch(e){
        emit(e.toString() as AuthState);
        

      }

    });
    
  }
}
