import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<UsernameEvent>((event, emit) {
      emit(state.copyWith(username: event.username));
    });
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<Password1Event>((event, emit) {
      emit(state.copyWith(password1: event.password1));
    });
    on<Password2Event>((event, emit) {
      emit(state.copyWith(password2: event.password2));
    });
  }
}
