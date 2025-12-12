import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {

    on<SignUpbuttonPressed>(updateEmployeeInfo);
  }

  Future<void> updateEmployeeInfo(SignUpbuttonPressed event, Emitter<SignUpState> emit) async{

    try{
      //final response = await http.post(Uri.parse("https://dummyjson.com/users/add"),
      final response = await http.put(Uri.parse("http://3.110.154.53:8001/api/employeeDetail/"),
      body: jsonEncode({
        //"empId":event.empId,
        "employeeName" : event.employeeName,
        //"employeeCode": event.employeeCode,
        "contactNo" : event.contactNo,
        "emailId" : event.emailId,
        "address" : event.address,
       // "orgId" : event.orgId,
        //"createdBy": event.createdBy,
        //"lastUpdatedBy":event.lastUpdatedBy,
       // event.body
      }),
      headers: {
        "Content-Type": "application/json",
        //"Authorization": "Bearer ${event.token}",
      },
      
      );
      if(response.statusCode==200){
        emit(SignUpSuccess());
      }else{
        emit(SignUpFailure("failed : ${response.body}"));
      }
      

    }catch(e){
      emit(SignUpFailure(e.toString()));
    }
  }
}
