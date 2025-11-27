import 'package:bloc/bloc.dart';
import 'package:demoproject/bloc/bloc_event.dart';
import 'package:demoproject/bloc/bloc_state.dart';

class CounterBloc extends Bloc<counterEvent , CounterState>{

  CounterBloc(): super(CounterState(0)){
    on<increamentEvent>((event , emit){
      emit(CounterState(state.counter + 1));
    });

    on<decreamentEvent>((event , emit){
      emit(CounterState(state.counter - 1));
    });
  }
}