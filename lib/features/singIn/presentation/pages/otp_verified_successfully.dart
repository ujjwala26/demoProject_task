import 'package:demoproject/features/singIn/presentation/widgets/sign_in_background.dart';
import 'package:flutter/material.dart';

class OtpVerifiedSuccessfully extends StatelessWidget {
  const OtpVerifiedSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SignInBackground(),
        ],
      ),
    );
  }
}