part of 'login_bloc.dart';

class LoginState {
  String email;
  String password;

  LoginState({
    required this.email,
    required this.password,
  });
}

class LoginInitial extends LoginState {
  // fast developement debugging
  LoginInitial() : super(email: '', password: '');
}
