part of 'otp_verification_bloc.dart';

abstract class OtpVerificationState {}

class OtpInitial extends OtpVerificationState {}

class OtpLoading extends OtpVerificationState {}

class OtpVerifiedSuccess extends OtpVerificationState {
  final Map<String, dynamic> data;
    OtpVerifiedSuccess(this.data);

}

class OtpVerifiedFailure extends OtpVerificationState {
  final String message;
  OtpVerifiedFailure(this.message);
}
