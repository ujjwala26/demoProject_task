import 'dart:developer';
import 'dart:io';
import 'package:demoproject/features/singIn/presentation/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class SignUpPage extends StatefulWidget {
 const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File? _selectedImage; 

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController mobController = TextEditingController();


  Future<void> _pickImageFromGallery() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    log("PickedImage : $pickedImage");
    if (pickedImage == null) return;

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }


  Future<void> _pickImageFromCamera() async {

    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
        log("PickedImage : $pickedImage");
    if (pickedImage == null) return;

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }


  @override
  Widget build(BuildContext context) {
     final mq = MediaQuery.of(context);
    final double width = mq.size.width;
    final double height = mq.size.height;


    //final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
       
          Positioned(
            top: -height * 0.15,
            right: -width * 0.4,
            child: Image.asset(
              "assets/images/Vibrant Monstera Leaf Detail.png",
              width: 500,
            ),
          ),
      
         
          Positioned(
            top: height * 0.23,
            right: -width * 0.35,
            child: Transform.rotate(
              angle: 50 * 3.14 / 180,
              child: Image.asset(
                "assets/images/Vibrant Monstera Leaf Detail.png",
                width: width * 0.6,
              ),
            ),
          ),
      
          Positioned(
            bottom: -height * 0.15,
            left: -width * 0.45,
            child: Transform.rotate(
              angle: 180 * 3.1415926535 / 180,
              child: Opacity(
                opacity: 0.15,
                child: Image.asset(
                  "assets/images/Vibrant Monstera Leaf Detail.png",
                  width: width * 1.1,
                ),
              ),
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(height: height * 0.05),
      
           
                const Text(
                  "Create\nAccount",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 91, 11),
                    fontSize: 30,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: height / 40),
      
                 GestureDetector(
                    onTap: _pickImageFromGallery,
                    child: CircleAvatar(
                     radius: width * 0.13,
                        
                      
                      backgroundColor: Colors.grey[300],
                      backgroundImage: _selectedImage != null
                          ? FileImage(_selectedImage!)
                          : null,
                      child: //Image.file(_selectedImage ?? File(''),errorBuilder: (context, error, stackTrace) =>const Icon(Icons.photo_album, size: 40) ,fit: BoxFit.contain,),
                      
              
                       _selectedImage == null
                          ? const Icon(Icons.photo_album, size: 40)
                          : null,
                    ),
                  ),
      
                 
      
                SizedBox(height: height / 35),
      
                 GestureDetector(
                    onTap: _pickImageFromCamera,
                    child: const Icon(Icons.camera_alt, size: 28),
                  ),
                
      
                SizedBox(height: height / 35),
      
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: usernameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Your Name",
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ),
                        SizedBox(height: height / 35),
                        
                        
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Your Mobile No",
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ),
                        SizedBox(height: height / 35),
                        
                        
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Your Email",
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ),
                        SizedBox(height: height / 35),
                        
                        
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Your Password",
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            suffix: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height / 35),
                        
                        
                        TextFormField(
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
      
               SizedBox(height: height / 35),
      
                SizedBox(
                  width: width * 0.9,
                  height: height * 0.050,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 10, 91, 11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
      
                SizedBox(height: height / 40),
      
      
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Back to ",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign in",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 10, 91, 11),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
