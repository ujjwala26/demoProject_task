import 'package:bloc/bloc.dart';
import 'package:demoproject/presentation/bloc/changeText/bloc/change_text_event.dart';
import 'package:demoproject/presentation/bloc/changeText/bloc/change_text_state.dart';





class ChangeTextBloc extends Bloc<ChangeTextEvent , ChangeTextState>{

  ChangeTextBloc() : super(ChangeTextState("hi")){
    on<ChangeTextEvent>((event , emit){
      emit(ChangeTextState(state.msg == "hello " ? "hi" :"welcome"));

    });

  }
}
