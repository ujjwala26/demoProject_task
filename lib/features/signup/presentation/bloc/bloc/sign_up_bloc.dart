import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demoproject/core/shared_pref.dart';
import 'package:http/http.dart' as http;
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {

    on<SignUpbuttonPressed>(updateEmployeeInfo);
  }

  Future<void> updateEmployeeInfo(SignUpbuttonPressed event, Emitter<SignUpState> emit) async{

    try{
      final storedUser = await AppPrefs.getUserData();

      final employeeId = storedUser["employeeId"] ?? event.employeeId;
      String token = await AppPrefs.getAccessToken() ?? "";

     
      final payload = {
        "employeeId": employeeId,
        "employeeName": event.employeeName,
        "contactNo": event.contactNo,
        "emailId": event.emailId,
        "address": event.address,
        "orgId": event.orgId,
        "createdBy": event.createdBy,
        "lastUpdatedBy": event.lastUpdatedBy,
      };

      final response = await http.put(
        Uri.parse("http://3.110.154.53:8001/api/employeeDetail/"),
        body: jsonEncode(payload),
        headers: {
          "Content-Type": "application/json",
          if (token.isNotEmpty) "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        final accessToken = decoded['accessToken'] ?? decoded['access'] ?? '';
        final refreshToken = decoded['refreshToken'] ?? decoded['refresh'] ?? '';
        final responseData = decoded['data'] ?? {};

        if (responseData.isNotEmpty) {
          await AppPrefs.saveUserData(user: Map<String, dynamic>.from(responseData));
        }

        if (accessToken.isNotEmpty || refreshToken.isNotEmpty) {
          await AppPrefs.savePartialUserData(
            email: responseData['emailId']?.toString() ?? event.emailId,
            accessToken: accessToken,
            refreshToken: refreshToken,
          );
        }

       
        if (responseData['emailId'] != null) {
          await AppPrefs.saveUserName(userName: responseData['emailId']?.toString() ?? '');
          await AppPrefs.saveEmail(responseData['emailId']?.toString() ?? event.emailId);
        }

       
        await AppPrefs.setLoggedIn(true);

        emit(SignUpSuccess());
      } else {
        String message;
        try {
          final body = jsonDecode(response.body);
          message = body['message']?.toString() ?? response.body;
        } catch (_) {
          message = response.body;
        }
        emit(SignUpFailure("failed : $message"));
      }

    }catch(e){
      emit(SignUpFailure(e.toString()));
    }
  }
}
