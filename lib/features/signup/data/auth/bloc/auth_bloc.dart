import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SaveUserData>((event , emit ){
      emit(userVerifiedSuccessfully(
        token: event.token,
        userId: event.userId,
        userName: event.userName,
        isNewUser: true,
      ));

      

    });
    
  }
}
