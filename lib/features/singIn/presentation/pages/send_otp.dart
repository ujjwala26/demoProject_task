import 'package:demoproject/features/singIn/presentation/widgets/sign_in_background.dart';
import 'package:flutter/material.dart';

class sendOtpScreen extends StatelessWidget {
  const sendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
        [
          SignInBackground(),
           SafeArea(
             child: Center(
               child: SingleChildScrollView(
                 child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  HeadingTextWidget(),
                  SizedBox(height: 40,),
                  subHeadingWidget(),
                  EmaiTextFormWidget(),
                  SubmitButtonWidget(),
                 
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
    return Text("OTP Verification",
    style: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: const Color.fromARGB(255, 10, 91, 11),
    ),);
  }
  Widget subHeadingWidget(){
    return Text("Enter Your Email Address / Mob No.",
    style: TextStyle(
      fontSize: 18,
    ),);
  }
  Widget EmaiTextFormWidget(){
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: TextFormField(
        
        decoration: InputDecoration(
          labelText: "Enter your Email / Mob No",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
      ),
    );
  }
  Widget SubmitButtonWidget(){
    return SizedBox(
      height: 60,
      width: 250,
      child: ElevatedButton(onPressed: (){
      
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 10, 91, 11),
      ),
       child: Text("Submit",
       style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22
       ),),
      ),
    );
  }
}