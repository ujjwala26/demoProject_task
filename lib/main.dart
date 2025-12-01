

import 'package:demoproject/bloc/counter_bloc.dart';
import 'package:demoproject/changeText/bloc/change_text_bloc.dart';
import 'package:demoproject/colorChange/bloc/change_color_bloc.dart';
import 'package:demoproject/learningPage/bloc/learning_page_bloc.dart';
import 'package:demoproject/screens/changeColor_screen.dart';
import 'package:demoproject/screens/change_text.dart';
import 'package:demoproject/screens/learning_page.dart';
import 'package:demoproject/screens/services_page.dart';
import 'package:demoproject/screens/toggle_button.dart';
import 'package:demoproject/servicesPage/bloc/services_bloc.dart';
import 'package:demoproject/toggleButton/bloc/toggle_button_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocProvider(create: (_)=>CounterBloc());
 
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
          BlocProvider(create: (context)=> ToggleButtonBloc(),),
          BlocProvider(create: (context)=> CounterBloc()),
          BlocProvider(create: (context)=> ChangeTextBloc()),
          BlocProvider(create: (context)=> ChangeColorBloc()),
          BlocProvider(create: (context)=> LearningPageBloc()),
          BlocProvider(create: (context) => ServicesBloc(),
           
          )

      ], child: ServicesPage() ),
    );
  }
}

