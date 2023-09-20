part of 'register_bloc.dart';

class RegisterState {
  final String username;
  final String email;
  final String password1;
  final String password2;

  RegisterState({
    required this.username,
    required this.email,
    required this.password1,
    required this.password2,
  });

  RegisterState copyWith({
    String? username,
    String? email,
    String? password1,
    String? password2,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password1: password1 ?? this.password1,
      password2: password2 ?? this.password2,
    ); // rigeeeel
  }
}

class RegisterInitial extends RegisterState {
  RegisterInitial()
      : super(username: '', email: '', password1: '', password2: '');
}
