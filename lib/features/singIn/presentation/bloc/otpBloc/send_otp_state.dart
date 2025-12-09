import 'package:equatable/equatable.dart';

abstract class OtpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSentSuccess extends OtpState {}

class OtpVerifiedSuccess extends OtpState {}

class OtpFailure extends OtpState {}
