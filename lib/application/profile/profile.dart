import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_platform/auth/login/bloc/login_bloc.dart';
import 'package:learning_platform/auth/login/controller/controller.dart';
import 'package:learning_platform/common/widgets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        leading: Image.asset(
          'assets/icons/menu.png',
          height: 12.h,
        ),
        text: 'Profile',
        trailing: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return PopupMenuButton(
              onSelected: (value) {
                LoginController(context: context).logoutHandler();
                state.email = '';
                state.password = '';
              },
              icon: Image.asset(
                'assets/icons/more-vertical.png',
              ),
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: 'logout',
                  child: Text('Log out'),
                ),
              ],
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            profilePic(),
            profileText(),
            buildListView(context: context),
          ],
        ),
      ),
    );
  }
}
