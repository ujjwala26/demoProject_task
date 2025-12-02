import 'package:demoproject/presentation/bloc/toggleButton/bloc/toggle_button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class toggleButton extends StatelessWidget {
  const toggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ToggleButtonBloc , ToggleButtonState>(
        builder: (context , state){
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.isOn ? "ON" : "OFF" ),
              Switch(
                value: state.isOn, 
                onChanged: (_)=> context.read<ToggleButtonBloc>().add(ToggleButtonEvent()))
          
            ],
          ),
        );
      }),
    );
  }
}