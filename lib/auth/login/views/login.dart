import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_platform/auth/login/bloc/login_bloc.dart';
import 'package:learning_platform/auth/login/controller/controller.dart';
import 'package:learning_platform/auth/register/views/register.dart';
import 'package:learning_platform/common/widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: 'Sign in'),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).requestFocus(
            FocusNode(), // disable keyboard if clicked outside
          ),
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 40.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            providerIcon('google'),
                            providerIcon('apple'),
                            providerIcon('facebook'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Text(
                          'Or use your email to login',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: buildTextField(
                              icon: 'user',
                              hint: 'Enter your email here',
                              type: 'email',
                              func: (input) {
                                state.email = input;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          buildTextField(
                            icon: 'lock',
                            hint: 'Enter your password here ',
                            type: 'password',
                            func: (input) {
                              state.password = input;
                            },
                          ),
                          forgotPassword(),
                          SizedBox(
                            height: 20.h,
                          ),
                          reusableButton('Log In', () async {
                            await LoginController(context: context)
                                .loginHandler();
                          }),
                          SizedBox(height: 15.h),
                          reusableButton('Register', () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ),
                              (route) => false,
                            );
                          }),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
