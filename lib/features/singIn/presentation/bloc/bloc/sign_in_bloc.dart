import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;


part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInButtonPressed>((event, emit) async {
      emit(SignInLoading()); 

      // await Future.delayed(Duration(seconds: 1)); 

      // if (event.email == "test@gmail.com" && event.password == "123456") {
      //   emit(SignInSuccess());
      // } else {
      //   emit(SignInFailure("Invalid email or password"));
      // }

      Future<void> _login(

        SignInButtonPressed event , Emitter<SignInState>emit)async{
          emit(SignInLoading());

          try{
            final response = await http.post(Uri.parse(""),
            body: jsonEncode({
              "email" : event.email,
              "password" : event.password,
            }),
            headers: {"Content - Type": "application/json"},);
            if(response.statusCode==200){
              final data = jsonDecode(response.body);
              emit(SignInSuccess());

            }else{
              emit(SignInFailure("invalid credentials"));
            }


          }catch(e){
            emit(SignInFailure(e.toString()));

          }
        }
    });
  }
}
