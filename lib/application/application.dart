import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_platform/application/bloc/application_bloc.dart';
import 'package:learning_platform/common/widgets.dart';
import 'package:learning_platform/constants/constants.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: buildPage(index: state.index),
              bottomNavigationBar: SizedBox(
                child: BottomNavigationBar(
                  showUnselectedLabels: true,
                  showSelectedLabels: true,
                  selectedItemColor: Constants.primaryElement,
                  currentIndex: state.index,
                  onTap: (value) {
                    state.index = value;
                    context.read<ApplicationBloc>().add(ApplicationEvent());
                  },
                  elevation: 0.05,
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  items: bottomItems(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
