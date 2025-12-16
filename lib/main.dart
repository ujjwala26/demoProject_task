
import 'package:demoproject/features/home/presentation/bloc/bloc/home_bloc_bloc.dart';
import 'package:demoproject/features/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:demoproject/features/signup/data/auth/bloc/auth_bloc.dart';
import 'package:demoproject/features/signup/presentation/bloc/bloc/sign_up_bloc.dart';
import 'package:demoproject/features/singIn/presentation/bloc/otpBloc/otp_verification_bloc.dart';
import 'package:demoproject/features/singIn/presentation/bloc/signinBloc/sign_in_bloc.dart';
import 'package:demoproject/features/learnings/presentation/bloc/learningPage/learning_page_bloc.dart';
import 'package:demoproject/features/services/presentation/bloc/bloc/servicesbloc_bloc.dart';
import 'package:demoproject/features/singIn/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 
  
 
  runApp(MyApp(
  
  ));
}

class MyApp extends StatelessWidget {


  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      home: MultiBlocProvider(
        providers: [

          BlocProvider(create: (context)=> LearningPageBloc()),
          BlocProvider(create: (context) => ServicesblocBloc(),),
          BlocProvider(create: (context)=> SignInBloc()),
          BlocProvider(create: (context)=> SignUpBloc()),
          BlocProvider(create: (context)=> HomeBlocBloc()),
          BlocProvider(create: (context)=> ProfileBloc()),
          BlocProvider(create: (context)=>OtpBloc()),
          BlocProvider(create: (context)=>AuthBloc())

          
          

      ], child:SignInPage(),
      ),
    );
  }
}

