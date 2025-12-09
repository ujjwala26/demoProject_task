part of 'otp_verification_bloc.dart';

abstract class OtpVerificationEvent {}

class VerifyOtpSubmitted extends OtpVerificationEvent {
  final String email;
  final String phoneNumber;
  final String otp;

  VerifyOtpSubmitted({
    required this.email,
    required this.phoneNumber,
    required this.otp,
  });
}