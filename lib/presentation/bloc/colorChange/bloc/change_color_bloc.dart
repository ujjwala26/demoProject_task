

import 'package:bloc/bloc.dart';
import 'package:demoproject/presentation/bloc/colorChange/bloc/change_color_event.dart';
import 'package:demoproject/presentation/bloc/colorChange/bloc/change_color_state.dart';
import 'package:flutter/material.dart';



class ChangeColorBloc extends Bloc<ChangeColorEvent, ChangeColorState> {
  ChangeColorBloc() : super(ChangeColorState(Colors.red)) {
    on<ChangeColorEvent>((event, emit) {
   
      on<ChangeColorEvent> ((event , emit){
        final NewColor=state.color==Colors.red ? Colors.blue : Colors.green;
        emit(ChangeColorState(NewColor));
      });

      
    });
  }
}
