import 'package:flutter/material.dart';

class otpVerificationScreen extends StatelessWidget {
  const otpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

        ],
      ),
      
    );
  }

  Widget _buildUi(){
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          children: [
            Column(
              children: [

              ],
            )
          ],
        ),
      )
       );
  }

  Widget HeadingText(){
    return Text("OTP Verification",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),);
  }
}