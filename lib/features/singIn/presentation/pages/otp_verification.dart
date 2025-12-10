// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:demoproject/features/singIn/presentation/widgets/verify_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import 'package:demoproject/features/singIn/presentation/bloc/otpBloc/otp_verification_bloc.dart';
import 'package:demoproject/features/singIn/presentation/pages/otp_verified_successfully.dart';
import 'package:demoproject/features/singIn/presentation/widgets/sign_in_background.dart';

class otpVerificationScreen extends StatefulWidget {
  final String userName;
  final String otp;
  
  //final String enteredOtp;
  //final String phoneNumber;
  //final String orgId;
  //final String email;

   otpVerificationScreen({
     
    required this.userName,
    required this.otp,
    //required this.enteredOtp,
  }) ;

  @override
  State<otpVerificationScreen> createState() => _otpVerificationScreenState();
}

class _otpVerificationScreenState extends State<otpVerificationScreen> {
  String enteredOtp = "";

  final TextEditingController otpController = TextEditingController();
  
  var orgId;

  @override
  void initState() {
    // TODO: implement initState

    if (widget.otp.isNotEmpty) {
      otpController.text = widget.otp;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Received OTP :  ${widget.otp}");

    return BlocProvider(
      create: (context) => OtpBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            const SignInBackground(),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeadingText(),
                      SizedBox(height: 30),
                      subHeading(),
                      SizedBox(height: 30),
                      getPasswordTextWidget(),
                      emailTextWidget(),
                      SizedBox(height: 60),
                      pinInputWidget(),
                      SizedBox(height: 60),
                      resendCodeWidget(),
                      SizedBox(height: 50),

                      VerifyButtonWidget(
                        userName: widget.userName,
                        otp: widget.otp,
                       otpController:otpController,
                       //orgId: orgId,
                      // email: widget.email,
                       
                      //  phoneNumber:widget.phoneNumber,
                       
                       )
                       ,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget HeadingText() {
    return Text(
      "OTP Verification",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 35,
        color: const Color.fromARGB(255, 10, 91, 11),
      ),
    );
  }

  Widget subHeading() {
    return Text(
      "Enter one-time password",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    );
  }

  Widget getPasswordTextWidget() {
    return Text(
      "OTP has been sent to your gmail account",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget emailTextWidget() {
    return Text(
      widget.userName,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget pinInputWidget() {
    return Center(
      child: Form(
        child: Column(
          children: [
            Pinput(
              length: 6,
              controller: otpController,
              onCompleted: (value) {
                enteredOtp = value;
                print("Entered value : $value");
                print("Entered OTP: $enteredOtp");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget resendCodeWidget() {
    return Text.rich(
      TextSpan(
        text: "Didn't receive the code? ",
        style: TextStyle(fontSize: 18),
        children: [
          TextSpan(
            text: "Resend OTP",
            style: TextStyle(
              color: const Color.fromARGB(255, 10, 91, 11),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }

  // Widget _VerifyButtonWidget({ required String otp, required String userName, required TextEditingController otpController}) {
  //   return SizedBox(
  //     height: 50,
  //     width: 250,
  //     child: ElevatedButton(
  //       onPressed: () {
  //         // if (enteredOtp == widget.otp) {
  //         //   ScaffoldMessenger.of(
  //         //     context,
  //         //   ).showSnackBar(SnackBar(content: Text("OTP Verified!")));

  //         //   Timer(Duration(seconds: 5), () {
  //         //     Navigator.pushReplacement(
  //         //       context,
  //         //       MaterialPageRoute(builder: (_) => OtpVerifiedSuccessfully()),
  //         //     );
  //         //   });
  //         // }
          
  //           context.read<OtpBloc>().add(
  //             VerifyOtpSubmitted(
  //               otp: widget.otp,
  //               userName: widget.userName, 
  //               enteredOtp: widget.enteredOtp,
  //              // enteredOtp:otpController.text, email: '', phoneNumber: '', orgId: null,
  //                )
  //           );
          
          
  //       },
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: const Color.fromARGB(255, 10, 91, 11),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadiusGeometry.circular(30),
  //         ),
  //       ),
  //       child: Text(
  //         "Verify",
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 18,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
