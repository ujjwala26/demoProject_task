import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {

    on<SignUpbuttonPressed>(signInButtonPressed);
  }

  Future<void> signInButtonPressed(SignUpbuttonPressed event, Emitter<SignUpState> emit) async{

    try{
      final response = await http.post(Uri.parse("https://dummyjson.com/users/add"),
      body: jsonEncode({
        "firstname" : event.firstname,
        "lastname": event.lastname,
        "age" : event.age,
        "email" : event.email,
        "username" : event.username,
        "password" : event.password,
      }),
      headers: {"Content-Type": "application/json"},
      );
      if(response.statusCode==201){
        emit(SignUpSuccess());
      }else{
        emit(SignUpFailure("failed : ${response.body}"));
      }
      

    }catch(e){
      emit(SignUpFailure(e.toString()));
    }
  }
}
