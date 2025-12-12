import 'package:demoproject/features/signup/presentation/bloc/bloc/sign_up_bloc.dart';
import 'package:demoproject/features/singIn/presentation/bloc/otpBloc/otp_verification_bloc.dart';
import 'package:demoproject/features/singIn/presentation/pages/otp_verified_successfully.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyButtonWidget extends StatelessWidget {
  final String userName;
  final String otp;

  //final int orgId;
  //final String email;
  //final String phoneNumber;


 final TextEditingController otpController;
 

  const VerifyButtonWidget({
    super.key,
    //required this.email,
   // required this.orgId,

    required this.userName,
    required this.otp, 
   required this.otpController, 
    //required this.phoneNumber,
    
  });

  



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<OtpBloc, OtpVerificationState>(
      listener: (context, state) {
        if (state is OtpVerifiedSuccess) {
          
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>BlocProvider(
      create: (_) => SignUpBloc(),
      child: OtpVerifiedSuccessfully(data: state.data,),
    ),
            ),
          );


        } else if (state is OtpVerifiedFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is OtpLoading) {
          return const CircularProgressIndicator();
        }
        return SizedBox(
          height: 50,
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              final enteredOtp = otpController.text.trim();
             
                context.read<OtpBloc>().add(
                      VerifyOtpSubmitted(
                        userName: userName,
                        otp: otp,
                        enteredOtp: enteredOtp,
                      
                       //email:email,
                       // phoneNumber: phoneNumber,
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
              "Verify",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}