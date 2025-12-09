import 'package:demoproject/features/singIn/presentation/widgets/sign_in_background.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OtpVerifiedSuccessfully extends StatelessWidget {
  const OtpVerifiedSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
         const SignInBackground(),

        SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeadingTextWidget(),
                  SizedBox(height: 20,),
                  VerifiedTextWidget(),
                  SuccessAnimationWidget(),
                  ThankYouTextWidget(),
                  SizedBox(height: 20,),
                  //VerificationSuccessWidget(),
                  
                ],
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
   Widget HeadingTextWidget(){
    return Text("Congratulations !",
    style: TextStyle(
      fontSize: 35,
      color: const Color.fromARGB(255, 10, 91, 11),
      fontWeight: FontWeight.bold
    ),);
  }
  Widget VerifiedTextWidget(){
    return Text("Verified Successfully!",
    style: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold
    ),);
  }

  Widget SuccessAnimationWidget(){
    return Center(
      child: Lottie.asset("assets/animations/Done.json",
      repeat: true,
      height: 250,
      width: 250),
    );
  }
  Widget ThankYouTextWidget(){
    return Text("Thank You !",
    style: TextStyle(
      fontSize: 45,
      color: const Color.fromARGB(255, 10, 91, 11),
    ),);
  }

  Widget VerificationSuccessWidget(){
    return Text("Your OTP Verification has been successfully completed !",
    style: TextStyle(
      fontSize: 16
    ),);
  }
}