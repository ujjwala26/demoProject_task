import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'servicesbloc_event.dart';
part 'servicesbloc_state.dart';

class ServicesblocBloc extends Bloc<ServicesblocEvent, ServicesblocState> {
  ServicesblocBloc() : super(ServicesblocInitial()) {
    on<ServicesblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
