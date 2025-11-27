import 'package:bloc/bloc.dart';


part 'toggle_button_event.dart';
part 'toggle_button_state.dart';

class ToggleButtonBloc extends Bloc<ToggleButtonEvent, ToggleButtonState> {
  ToggleButtonBloc() : super(ToggleButtonState(false)) {
    on<ToggleButtonEvent>((event, emit) {
      // TODO: implement event handler

      emit(ToggleButtonState(!state.isOn));
    });
  }
}
