part of 'otp_verification_bloc.dart';

abstract class OtpVerificationState {}

class OtpInitial extends OtpVerificationState {}

class OtpLoading extends OtpVerificationState {}

class OtpVerifiedSuccess extends OtpVerificationState {}

class OtpVerifiedFailure extends OtpVerificationState {
  final String message;
  OtpVerifiedFailure(this.message);
}
