import 'package:demoproject/features/singIn/presentation/widgets/sign_in_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class otpVerificationScreen extends StatelessWidget {
  const otpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        
        children : [
          const SignInBackground(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    HeadingText(),
                    SizedBox(height: 30,),
                    subHeading(),
                    SizedBox(height: 30,),
                    getPasswordTextWidget(),
                    emailTextWidget(),
                    SizedBox(height: 60,),
                    pinInputWidget(),
                    SizedBox(height: 60,),
                    resendCodeWidget(),
                    SizedBox(height: 50,),
                      
                    _VerifyButtonWidget()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      
    );
  }

 

  Widget HeadingText(){
    return Text("OTP Verification",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: const Color.fromARGB(255, 10, 91, 11),
    ),);
  }

  Widget subHeading(){
    return Text("Enter one-time password",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,

    ),);
  }
  Widget getPasswordTextWidget(){
    return Text("OTP has been sent to your gmail account",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),);
  }

  Widget emailTextWidget(){
    return Text("kujj.....@gmail.com",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),);
  }
 
  Widget pinInputWidget(){
    return Center(
      child: Form(
        child: Column(
          children: [
           Pinput(
            length: 6,
            onCompleted: (value) {
              print("Entered value : $value");
            },
           )
          ],
        )
        ),
    );

  }
  Widget resendCodeWidget(){
    return Text.rich(
       TextSpan(text: "Didn't receive the code? ",
       style: TextStyle(
        fontSize: 18
       ),
       children: [
        TextSpan(
          text: "Resend OTP",
          style: TextStyle(
              color: const Color.fromARGB(255, 10, 91, 11),
              fontWeight: FontWeight.bold,
              fontSize: 18),
          recognizer: TapGestureRecognizer()..onTap=(){
            
            
          }
        ),
        
       ]
       ),
       
       );

  }
  Widget _VerifyButtonWidget(){
    return SizedBox(
      height: 50,
      width: 250,
      child: ElevatedButton(onPressed: (){
      
      }, 
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 10, 91, 11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        )
      ),
      child: Text("Verify",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),)),
    );
  }
}