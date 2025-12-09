import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';

class OtpBloc extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  OtpBloc() : super(OtpInitial()) {
    on<VerifyOtpSubmitted>(verifyOtp);
  }

  Future<void> verifyOtp(
    VerifyOtpSubmitted event,
    Emitter<OtpVerificationState> emit,
  ) async {
    emit(OtpLoading());

    try {
      await Future.delayed(const Duration(seconds: 1)); // fake API call

      if (event.otp == "1234") {
        emit(OtpVerifiedSuccess());
      } else {
        emit(OtpVerifiedFailure("Invalid OTP"));
      }
    } catch (e) {
      emit(OtpVerifiedFailure(e.toString()));
    }
  }
}
