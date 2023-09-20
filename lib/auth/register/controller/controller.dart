import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_platform/auth/login/controller/controller.dart';
import 'package:learning_platform/auth/login/views/login.dart';
import 'package:learning_platform/auth/register/bloc/register_bloc.dart';
import 'package:learning_platform/common/widgets.dart';

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});
  registerHandler() async {
    final state = context.read<RegisterBloc>().state;
    final String username = state.username;
    final String email = state.email;
    final String password1 = state.password1;
    final String password2 = state.password2;
    final FirebaseAuth auth = FirebaseAuth.instance;

    if (username.isEmpty) {
      toastInfo(msg: 'you need to fill your username');
      return;
    } else if (username.length < 6) {
      toastInfo(msg: 'username must contain at least 5 charecters');
      return;
    } else if (username.contains(' ')) {
      toastInfo(msg: 'username should not contain spaces');
      return;
    } else if (email.isEmpty) {
      await toastInfo(msg: 'you need to fill your email ');
      return;
    } else if (password1.isEmpty) {
      await toastInfo(msg: 'You need to fill your password');
      return;
    } else if (password2.isEmpty) {
      await toastInfo(msg: 'You need to confirm your password');
      return;
    } else if (password1 == password2) {
      try {
        final UserCredential userCrendential =
            await auth.createUserWithEmailAndPassword(
          email: email,
          password: password1,
        );

        User? user = userCrendential.user;
        if (user != null) {
          await user.sendEmailVerification();
          toastInfo(
            msg:
                'An email verification has been sent to your email\nPlease check your email box',
          );
          await user.updateDisplayName(username);
          if (!context.mounted) return;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
              (route) => false);
        } else {
          await toastInfo(
            msg: 'error getting user from firebase',
          );
          return;
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          toastInfo(msg: 'email already in use');
          return;
        } else if (e.code == 'invalid-email') {
          toastInfo(msg: e.code.cleanError());
          return;
        } else if (e.code == 'operation-not-allowed') {
          toastInfo(msg: e.code.cleanError());
          return;
        } else if (e.code == 'weak-password') {
          toastInfo(msg: 'weak password');
          return;
        } else {
          toastInfo(msg: 'network request failed');
        }
      }
    } else {
      await toastInfo(
        msg: 'passwords do not match',
      );
      return;
    }
  }
}
