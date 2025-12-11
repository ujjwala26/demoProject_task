import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

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
    final response = await http.post(
      Uri.parse("http://3.110.154.53:8001/api/verifyOTP/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        //"email": event.email,
        //"phoneNumber": event.phoneNumber,
       // "orgId": event.orgId,
        "otp": event.otp,
        "userName": event.userName, 
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      emit(OtpVerifiedSuccess());
    } else {
      emit(OtpVerifiedFailure(data['message'] ?? "Issue in OTP Verification."));
    }
  } catch (e) {
    emit(OtpVerifiedFailure(e.toString()));
  }
}


}
