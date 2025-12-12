import 'dart:async';
import 'dart:developer';
import 'package:demoproject/features/home/presentation/pages/home_page.dart';
import 'package:demoproject/features/signup/data/auth/bloc/auth_bloc.dart';
import 'package:demoproject/features/signup/presentation/bloc/bloc/sign_up_bloc.dart';
import 'package:demoproject/features/signup/presentation/pages/sign_up.dart';
import 'package:demoproject/features/singIn/presentation/widgets/sign_in_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class OtpVerifiedSuccessfully extends StatefulWidget {
  final Map<String, dynamic> data;
  const OtpVerifiedSuccessfully({super.key, required this.data});

  @override
  State<OtpVerifiedSuccessfully> createState() =>
      _OtpVerifiedSuccessfullyState();
}

class _OtpVerifiedSuccessfullyState extends State<OtpVerifiedSuccessfully> {
  bool isLoggedIn = false;
  
  @override
  void initState() {
    super.initState();
    checkLoginSattus();

    // if(isLoggedIn){
    //   bool isLoggedIn=await AppPrefs.getLoginStatus();
    //   super.initState();
    // Timer(Duration(seconds: 2), (){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

    // });

    // }else{
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
    // }
  }

  void checkLoginSattus() async {
    // bool status = await AppPrefs.getLoginStatus();
    // isLoggedIn=status;
 

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //final userData=widget.data['data'];

      // context.read<AuthBloc>().add(
      //   SaveUserData(token: userData['token'], userId: userData['userId'], userName: userData['userName'],)
      // );
      
        bool isNewUser = widget.data["data"]["isNewUser"] ?? false;
       // bool isNewUser = userData["data"]["isNewUser"] ?? false;
            log("Token: ${widget.data['data']['token']}");
            log("User ID: ${widget.data['data']['userId']}");
            log("isNewUser: ${widget.data['data']['isNewUser']}");
            log("usernName: ${widget.data['data']['userName']}");
        if (!isNewUser) {
        Timer(Duration(seconds: 2), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );


        });
      } else {
        

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => SignUpPage()),
        //   );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<SignUpBloc>(),
              child: SignUpPage(),
            ),
          ),
        );
      }
    });
   
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Stack(
          children: [
            const SignInBackground(),

            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeadingTextWidget(),
                      SizedBox(height: 20),
                      VerifiedTextWidget(),
                      SuccessAnimationWidget(),
                      ThankYouTextWidget(),
                      SizedBox(height: 20),

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

  Widget HeadingTextWidget() {
    return Text(
      "Congratulations !",
      style: TextStyle(
        fontSize: 35,
        color: const Color.fromARGB(255, 10, 91, 11),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget VerifiedTextWidget() {
    return Text(
      "Verified Successfully!",
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget SuccessAnimationWidget() {
    return Center(
      child: Lottie.asset(
        "assets/animations/Done.json",
        repeat: true,
        height: 250,
        width: 250,
      ),
    );
  }

  Widget ThankYouTextWidget() {
    return Text(
      "Thank You !",
      style: TextStyle(
        fontSize: 45,
        color: const Color.fromARGB(255, 10, 91, 11),
      ),
    );
  }

  Widget VerificationSuccessWidget() {
    return Text(
      "Your OTP Verification has been successfully completed !",
      style: TextStyle(fontSize: 16),
    );
  }
}
