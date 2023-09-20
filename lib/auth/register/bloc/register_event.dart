part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class UsernameEvent extends RegisterEvent {
  final String username;

  UsernameEvent({required this.username});
}

class EmailEvent extends RegisterEvent {
  final String email;

  EmailEvent({required this.email});
}

class Password1Event extends RegisterEvent {
  final String password1;

  Password1Event({required this.password1});
}

class Password2Event extends RegisterEvent {
  final String password2;

  Password2Event({required this.password2});
}
