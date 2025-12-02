import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInButtonPressed>((event, emit) async {
      emit(SignInLoading()); 

      await Future.delayed(Duration(seconds: 1)); 

      if (event.email == "test@gmail.com" && event.password == "123456") {
        emit(SignInSuccess());
      } else {
        emit(SignInFailure("Invalid email or password"));
      }
    });
  }
}
