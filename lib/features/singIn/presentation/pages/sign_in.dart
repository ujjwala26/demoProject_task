
import 'package:demoproject/features/singIn/presentation/bloc/bloc/sign_in_bloc.dart';
import 'package:demoproject/features/singIn/presentation/widgets/sign_in_background.dart';
import 'package:demoproject/features/singIn/presentation/widgets/sign_in_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});



  @override
  Widget build(BuildContext context) {
  

    return BlocProvider(
      create: (context) => SignInBloc()..add(SignInEvent()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              const SignInBackground(),
              const SignInForm(),
            

             
            ],
          ),
        ),
      ),
    );
  }
}
