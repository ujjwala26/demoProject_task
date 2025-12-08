
import 'package:demoproject/core/shared_pref.dart';
import 'package:demoproject/features/home/presentation/bloc/bloc/home_bloc_bloc.dart';
import 'package:demoproject/features/home/presentation/pages/bottom_navigation.dart';
import 'package:demoproject/features/home/presentation/pages/home_page.dart';
import 'package:demoproject/features/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:demoproject/features/profile/presentation/pages/profile_page.dart';
import 'package:demoproject/features/signup/presentation/bloc/bloc/sign_up_bloc.dart';
import 'package:demoproject/features/signup/presentation/pages/sign_up.dart';
import 'package:demoproject/features/singIn/presentation/bloc/bloc/sign_in_bloc.dart';
import 'package:demoproject/features/learnings/presentation/bloc/learningPage/learning_page_bloc.dart';
import 'package:demoproject/features/services/presentation/bloc/bloc/servicesbloc_bloc.dart';
import 'package:demoproject/features/singIn/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await AppPrefs.getAccessToken();
  
 
  runApp(MyApp(
    isLoggedIn: token !=null,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  
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
          

      ], child: ProfilePage() ),
    );
  }
}

