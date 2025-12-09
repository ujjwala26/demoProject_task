import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendOtpEvent extends OtpEvent {
  final String phone;
  SendOtpEvent(this.phone);

  @override
  List<Object?> get props => [phone];
}

class VerifyOtpEvent extends OtpEvent {
  final String phone;
  final String otp;
  VerifyOtpEvent(this.phone, this.otp);

  @override
  List<Object?> get props => [phone, otp];
}
