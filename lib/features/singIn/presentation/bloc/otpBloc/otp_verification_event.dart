part of 'otp_verification_bloc.dart';

abstract class OtpVerificationEvent {}

class VerifyOtpSubmitted extends OtpVerificationEvent {
  final String userName;
  //final String email;
 // final String phoneNumber;
  //final int orgId;
  final String otp;

  VerifyOtpSubmitted({
    required this.userName,
    //required this.email,
    //required this.phoneNumber,
    //required this.orgId,
    required this.otp, required String enteredOtp, 
    //required String enteredOtp,
  });

  
}
