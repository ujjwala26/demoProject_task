
import 'package:demoproject/features/home/presentation/bloc/bloc/home_bloc_bloc.dart';
import 'package:demoproject/features/signup/presentation/bloc/bloc/sign_up_bloc.dart';
import 'package:demoproject/features/singIn/presentation/bloc/bloc/sign_in_bloc.dart';
import 'package:demoproject/features/singIn/presentation/pages/sign_in.dart';
import 'package:demoproject/features/learnings/presentation/bloc/learningPage/learning_page_bloc.dart';
import 'package:demoproject/features/services/presentation/bloc/bloc/servicesbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
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
          

      ], child: SignInPage() ),
    );
  }
}

