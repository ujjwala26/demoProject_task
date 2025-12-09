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
    
  }

  Future<void> signInButtonPressed(SignInButtonPressed event, Emitter<SignInState> emit)async {
    try{
            final response = await http.post(Uri.parse("http://3.110.154.53:8001/api/sendOTP/"),
            body: jsonEncode({
              "email" : event.email
              ,
              //"email" : event.email,
              "phoneNumber" : event.phoneNumber,
              "orgId" : 1,
            }),
            headers: {"Content-Type": "application/json"},);
            if(response.statusCode==200){
              final data = jsonDecode(response.body);
              // final access = data["access"];
              // final refresh = data["refresh"];

              emit(SignInSuccess(data['message']));

              // await AppPrefs.saveTokens( 
              //   access: access ,
              //   refresh : refresh);
              //emit(SignInSuccess(data['message']));

            }else{
              emit(SignInFailure("Failed to send OTP"));
            }


          }catch(e){
            emit(SignInFailure(e.toString()));

          }
  }
}
