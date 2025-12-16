import 'dart:io';
import 'package:demoproject/core/shared_pref.dart';
import 'package:demoproject/features/home/presentation/pages/home_page.dart';
import 'package:demoproject/features/signup/presentation/bloc/bloc/sign_up_bloc.dart';
import 'package:demoproject/features/signup/presentation/widgets/text_form_field.dart';
import 'package:demoproject/features/singIn/presentation/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpForm extends StatefulWidget {
  final String employeeId;
  final int empId;
  final String orgId;
  final int createdBy;
  final int lastUpdatedBy;

  const SignUpForm({
    super.key,
    this.employeeId = '',
    required this.empId,
    required this.orgId,
    required this.createdBy,
    required this.lastUpdatedBy,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  File? _selectedImage;

  final employeeNameController = TextEditingController();
  final contactNoController=TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();



  //   void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final authState = context.read<AuthBloc>().state;

  //     if (authState is userVerifiedSuccessfully) {
  //       employeeNameController.text = authState.userName ?? "";
  //     }
  //   });
  // }

@override
  void initState() {
    super.initState();

    Future<void> loadEmail() async {
      emailController.text = await AppPrefs.getEmail() ?? "";
    }

    Future<void> loadUserData() async {
      final user = await AppPrefs.getUserData();
      if (user.isNotEmpty) {
        employeeNameController.text = user['employeeName']?.toString() ?? user['userName']?.toString() ?? '';
        contactNoController.text = user['phoneNumber']?.toString() ?? user['contactNo']?.toString() ?? '';
        emailController.text = user['email']?.toString() ?? user['emailId']?.toString() ?? emailController.text;
        addressController.text = user['address']?.toString() ?? '';
      }
    }

    loadEmail();
    loadUserData();
  }

  @override
  void dispose() {
    emailController.dispose();
    contactNoController.dispose();
    addressController.dispose();
    employeeNameController.dispose();
   

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Loaded email: ${emailController.text}");

    
    //final authState = context.watch<AuthBloc>().state;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Future<void> pickImageFromGallery() async {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      //log("PickedImage : $pickedImage");
      if (pickedImage == null) return;

      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }

    Future<void> pickImageFromCamera() async {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      //log("PickedImage : $pickedImage");
      if (pickedImage == null) return;

      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }

    // Future<void> _pickImageFromGallery()async{
    //   final file = await ImagePickerServices.pickFromGallery();
    //   if(file==null) return ;
    //   setState(() {
    //     _selectedImage=file;
    //   });

    // }

    // Future<void>_pickImageFromCamera()async{
    //   final file = await ImagePickerServices.pickFromCamera();
    //   if(file==null) return;
    //   setState(() {
    //     _selectedImage=file;
    //   });

    // }
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if(state is SignUpFailure){
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message),
          backgroundColor: Colors.red,)
          );

        }else if(state is SignUpSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Registered Successfully!"),
            backgroundColor: Colors.green,)
          );
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
        }
      },
      builder: (context, state) {
        return Padding(
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
                onTap: pickImageFromGallery,
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
                onTap: pickImageFromCamera,
                child: const Icon(Icons.camera_alt, size: 28),
              ),

              SizedBox(height: height / 35),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      textFieldWidget(
                        controller: employeeNameController,
                        labelText: "Employee Name ",
                      ),
                      SizedBox(height: height / 35),
                      textFieldWidget(
                        controller: contactNoController,
                        labelText: "Contact No",
                      ),
                      SizedBox(height: height / 35),
                      textFieldWidget(
                        controller: emailController,
                        labelText: "Email",
                        //enabled: false,
                        
                      ),
                      SizedBox(height: height / 35),
                      textFieldWidget(
                        controller: addressController,
                        labelText: "Address",
                      ),
                      SizedBox(height: height / 35),
                      // textFieldWidget(
                      //   controller: usernameController,
                      //   labelText: "Username",
                      // ),

                      // TextFormField(
                      //   controller: passwordController,
                      //   decoration: InputDecoration(
                      //     labelText: "Your Password",
                      //     labelStyle: TextStyle(color: Colors.grey.shade600),
                      //     enabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.grey.shade300),
                      //     ),
                      //     suffix: TextButton(
                      //       onPressed: () {},
                      //       child: Text(
                      //         "Forgot?",
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.green.shade800,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: height / 35),

                      // textFieldWidget(
                      //   controller: confirmPasswordController,
                      //   labelText: 'Password',
                      // ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: height / 35),

              SizedBox(
                width: width * 0.9,
                height: height * 0.050,
                child: ElevatedButton(
                  onPressed: () async{
                    context.read<SignUpBloc>().add(
                      SignUpbuttonPressed(
                        widget.employeeId,
                          empId: widget.empId,
                          employeeName: employeeNameController.text,
                          contactNo: contactNoController.text,
                          emailId: emailController.text,
                          address: addressController.text,
                          orgId: widget.orgId,
                          createdBy: widget.createdBy,
                          lastUpdatedBy: widget.lastUpdatedBy,
                          
                        
                        

                        
                        
                      ),
                    );
                  },
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
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
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
        );
      },
    );
  }
}
