import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_platform/auth/login/views/login.dart';
import 'package:learning_platform/auth/register/bloc/register_bloc.dart';
import 'package:learning_platform/auth/register/controller/controller.dart';
import 'package:learning_platform/common/widgets.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
              (route) => false),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        text: 'Sign up',
      ),
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
                      SizedBox(
                        height: 50.h,
                      ),
                      Center(
                        child: Text(
                          'Enter your details below & sign up for free',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: buildTextField(
                          icon: 'user',
                          hint: 'Enter your username here',
                          type: 'username',
                          func: (username) {
                            context.read<RegisterBloc>().add(
                                  UsernameEvent(username: username),
                                );
                          },
                        ),
                      ),
                      buildTextField(
                        icon: 'user',
                        hint: 'Enter your email here ',
                        type: 'email',
                        func: (email) {
                          context
                              .read<RegisterBloc>()
                              .add(EmailEvent(email: email));
                        },
                      ),
                      buildTextField(
                        icon: 'lock',
                        hint: 'Enter your password here ',
                        type: 'password',
                        func: (password1) {
                          context
                              .read<RegisterBloc>()
                              .add(Password1Event(password1: password1));
                        },
                      ),
                      buildTextField(
                        icon: 'lock',
                        hint: 'Repeat your password here ',
                        type: 'password confirmation',
                        func: (password2) {
                          context
                              .read<RegisterBloc>()
                              .add(Password2Event(password2: password2));
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'When creating an account, you have to\nagree on our terms and conditions ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      reusableButton('Register', () {
                        RegisterController(context: context).registerHandler();
                      }),
                    ],
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
