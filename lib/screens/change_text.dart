import 'package:demoproject/changeText/bloc/change_text_bloc.dart';
import 'package:demoproject/changeText/bloc/change_text_event.dart';
import 'package:demoproject/changeText/bloc/change_text_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class changeText extends StatelessWidget {
  const changeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChangeTextBloc, ChangeTextState>(builder: (context , state){
        return 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(state.msg, 
              style: TextStyle(
                fontSize: 50
              ),),
              ElevatedButton(onPressed: (){
                context.read<ChangeTextBloc>().add(ChangeTextEvent());
                
              }, child: Text("Change Text")),
            ],
          ),
        );
      }),
    );
  }
}