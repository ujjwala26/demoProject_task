
import 'package:demoproject/features/singIn/presentation/bloc/otpBloc/send_otp_event.dart';
import 'package:demoproject/features/singIn/presentation/bloc/otpBloc/send_otp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState>{
  OtpBloc(): super(OtpInitial()){
    on<OtpEvent>((event, emit){

    });
  }
}