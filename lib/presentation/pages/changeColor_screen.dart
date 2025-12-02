import 'package:demoproject/presentation/bloc/colorChange/bloc/change_color_bloc.dart';
import 'package:demoproject/presentation/bloc/colorChange/bloc/change_color_event.dart';
import 'package:demoproject/presentation/bloc/colorChange/bloc/change_color_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeColor extends StatelessWidget {
  const ChangeColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChangeColorBloc, ChangeColorState>(

        builder: (context , state){
          return GestureDetector(
            onTap: () => context.read<ChangeColorBloc>().add(ChangeColorEvent(),
            ),
            child: Center(
              child: Container(
                height: 200,
                width: 200,
                color: state.color,
              ),
            ),
          );

        }),
    );
  }
}