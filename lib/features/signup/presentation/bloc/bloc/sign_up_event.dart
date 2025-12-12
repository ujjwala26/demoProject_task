part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpbuttonPressed extends SignUpEvent{

  //final int empId;
  final String employeeName;
  //final String employeeCode;
  final String contactNo;
  final String emailId ;
  final String address;
  //final String orgId;
  //final int createdBy;
  //final int lastUpdatedBy;



  SignUpbuttonPressed({
    //required this.empId, 
    required this.employeeName, 
    //required this.employeeCode,
    required this.contactNo,
    required this.emailId,
    required this.address,
    //required this.orgId, 
    //required this.createdBy, 
    //required this.lastUpdatedBy, 
  }
    );
      

}


