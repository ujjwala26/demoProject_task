import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demoproject/core/shared_pref.dart';
import 'package:http/http.dart' as http;


part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInButtonPressed>(signInButtonPressed);
    // on<SignInButtonPressed>((event, emit) async {
    //   emit(SignInLoading()); 
    //   try{
    //         final response = await http.post(Uri.parse("https://fakestoreapi.com/auth/login"),
    //         body: jsonEncode({
    //           "username" : event.password,
    //           //"email" : event.email,
    //           "password" : event.username,
    //         }),
    //         headers: {"Content-Type": "application/json"},);
    //         if(response.statusCode==201){
    //           final data = jsonDecode(response.body);
    //           final token=data["token"];
    //           print("token : $token");
    //           emit(SignInSuccess());

    //         }else{
    //           emit(SignInFailure("invalid credentials"));
    //         }


    //       }catch(e){
    //         emit(SignInFailure(e.toString()));

    //       }

    //   // await Future.delayed(Duration(seconds: 1)); 

    //   // if (event.email == "test@gmail.com" && event.password == "123456") {
    //   //   emit(SignInSuccess());
    //   // } else {
    //   //   emit(SignInFailure("Invalid email or password"));
    //   // }

    //   Future<void> login(

    //     SignInButtonPressed event , Emitter<SignInState>emit)async{
    //       emit(SignInLoading());

    //       try{
    //         final response = await http.post(Uri.parse("https://fakestoreapi.com/auth/login"),
    //         body: jsonEncode({
    //           "username" : event.username,
    //           //"email" : event.email,
    //           "password" : event.password,
    //         }),
    //         headers: {"Content-Type": "application/json"},);
    //         if(response.statusCode==200){
    //           final data = jsonDecode(response.body);
    //           final token=data["token"];
    //           print("token : $token");
    //           emit(SignInSuccess());

    //         }else{
    //           emit(SignInFailure("invalid credentials"));
    //         }


    //       }catch(e){
    //         emit(SignInFailure(e.toString()));

    //       }
    //     }
    // });
  }

  Future<void> signInButtonPressed(SignInButtonPressed event, Emitter<SignInState> emit)async {
    try{
            final response = await http.post(Uri.parse("http://3.110.154.53:8001/api/token/"),
            body: jsonEncode({
              "userName" : event.userName,
              //"email" : event.email,
              "password" : event.password,
            }),
            headers: {"Content-Type": "application/json"},);
            if(response.statusCode==200){
              final data = jsonDecode(response.body);
              final access= data["access"];
              final refresh=data["refresh"];

              await AppPrefs.saveTokens( access: access ,refresh : refresh);
              emit(SignInSuccess());

            }else{
              emit(SignInFailure("invalid credentials"));
            }


          }catch(e){
            emit(SignInFailure(e.toString()));

          }
  }
}
