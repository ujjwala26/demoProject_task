import 'package:demoproject/screens/home_page.dart';
import 'package:demoproject/screens/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, 
        body: Stack(
          
          children:[ 
          Positioned(
          top: -height * 0.15,
          right: -width * 0.40,
          child: Image.asset(
            "assets/images/Vibrant Monstera Leaf Detail.png",
            width: 500,
          ),
        ),
        Positioned(
          top: height * 0.25,
          
          right: -width * 0.45,
          
          child: Transform.rotate(
            angle: 50 *3.14/180,
            child: Image.asset(
              "assets/images/Vibrant Monstera Leaf Detail.png",
              width: width * 0.70,
            ),
          ),
        ),
        
        Positioned(
          bottom: -height * 0.1,
          left: -width * 0.3,
          child: Transform.rotate(
            angle: 180 * 3.1415926535 / 180,
          
          child: Opacity(
            opacity: 0.15,
            child: Image.asset(
              "assets/images/Vibrant Monstera Leaf Detail.png",
              width: width * 0.9,
            ),
          ),
        ),
        ),
          
            Padding(
              padding: const EdgeInsets.all(20.0),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      SizedBox(height: height * 0.2,),
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
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
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
                        onPressed: (){
                        
                        },
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()));
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
                        child: Text("or",
                        style: TextStyle(
                          fontSize: height * 0.02
                        ),),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),
                        
                  SizedBox(height: height * 0.03),
                        
                  
                  SizedBox(
                    width: double.infinity,
                    height: height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 235, 250, 235),
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
                                      builder: (context) => SignUpPage()),
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
            ),
          ]
        ),
      ),
    );
  }
}
