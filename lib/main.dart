

import 'package:demoproject/features/learnings/presentation/pages/learning_page.dart';
import 'package:demoproject/presentation/bloc/counterPage/counter_bloc.dart';
import 'package:demoproject/presentation/bloc/changeText/bloc/change_text_bloc.dart';
import 'package:demoproject/presentation/bloc/colorChange/bloc/change_color_bloc.dart';
import 'package:demoproject/features/learnings/presentation/bloc/learningPage/learning_page_bloc.dart';
import 'package:demoproject/presentation/bloc/toggleButton/bloc/toggle_button_bloc.dart';
import 'package:demoproject/features/services/presentation/bloc/bloc/servicesbloc_bloc.dart';
import 'package:demoproject/features/services/presentation/pages/service_page.dart';

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
          BlocProvider(create: (context) => ServicesblocBloc(),
           
          )

      ], child: ServicesPage() ),
    );
  }
}

