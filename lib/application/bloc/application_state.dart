part of 'application_bloc.dart';

class ApplicationState {
  int index;

  ApplicationState({required this.index});
}

class ApplicationInitial extends ApplicationState {
  ApplicationInitial() : super(index: 0);
}
