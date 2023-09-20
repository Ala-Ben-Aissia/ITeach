part of 'welcome_bloc.dart';

class WelcomeState {
  int index;

  WelcomeState({required this.index});
}

class WelcomeInitial extends WelcomeState {
  WelcomeInitial() : super(index: 0);
}
