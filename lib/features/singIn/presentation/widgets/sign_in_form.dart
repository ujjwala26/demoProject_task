import 'dart:developer';

import 'package:demoproject/features/home/presentation/pages/home_page.dart';
import 'package:demoproject/features/signup/presentation/pages/sign_up.dart';
import 'package:demoproject/features/singIn/presentation/bloc/bloc/sign_in_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

    //final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final userNameController= TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if(state is SignInFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }else if (state is SignInSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Successful!"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        }
      


        },
      
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.2),
              Text(
                "Welcome\nBack",
                style: TextStyle(
                  fontSize: height * 0.04,
                  height: 1.1,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 10, 91, 11),
                ),
              ),

              SizedBox(height: height * 0.05),

              TextFormField(
                //controller: emailController,
                controller: userNameController  ,
                decoration: InputDecoration(
                  labelText: "username",
                  //labelText: "Email",
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  suffix: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot?",
                      style: TextStyle(
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // suffixText: "Forgot",
                  // suffixStyle: TextStyle(
                  //   color: Colors.green.shade800,
                  //   fontWeight: FontWeight.bold,
                  // )
                ),
              ),

              SizedBox(height: height * 0.05),

              SizedBox(
                width: double.infinity,
                height: width * 0.13,
                child: ElevatedButton(
                  onPressed: () {
                    log('UserName : ${userNameController.text}');
                    log('Password : ${passwordController.text}');
                    context.read<SignInBloc>().add(
                      SignInButtonPressed(
                        //email,
                        userNameController.text,
                         passwordController.text,
                      )
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomePage()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 10, 91, 11),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "or",
                      style: TextStyle(fontSize: height * 0.02),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),

              SizedBox(height: height * 0.03),

              SizedBox(
                width: double.infinity,
                height: height * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 235, 250, 235),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.green),
                    ),
                  ),
                  child: Text(
                    "Sign in with Google",
                    style: TextStyle(
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.05),

              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Create account? ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: height * 0.02,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 10, 91, 11),
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.02,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.020),
            ],
          ),
        );
      },
    );
  }
}
