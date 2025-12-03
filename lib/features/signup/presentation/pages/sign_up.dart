
import 'package:demoproject/features/signup/presentation/widgets/sign_up_background.dart';
import 'package:demoproject/features/signup/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';



class SignUpPage extends StatefulWidget {
 const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
       const SignUpBackground(),
       const SignUpForm(),
       ],
      ),
     );
  }
}
