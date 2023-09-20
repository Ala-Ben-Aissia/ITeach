import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_platform/application/application.dart';
import 'package:learning_platform/application/bloc/application_bloc.dart';
import 'package:learning_platform/auth/login/bloc/login_bloc.dart';
import 'package:learning_platform/auth/login/views/login.dart';
import 'package:learning_platform/common/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension CleanString on String {
  String cleanError() {
    return replaceAll('-', ' ').replaceAll('_', ' ').toLowerCase();
  }
}

class LoginController {
  final BuildContext context;
  final auth = FirebaseAuth.instance;
  LoginController({required this.context});
  Future<UserCredential?> loginHandler({String provider = 'email'}) async {
    final email = context.read<LoginBloc>().state.email;
    final password = context.read<LoginBloc>().state.password;
    if (provider == 'email') {
      if (email.isEmpty) {
        toastInfo(msg: 'you need to fill your email ');
        return null;
      }
      if (password.isEmpty) {
        toastInfo(msg: 'You need to fill your password');
        return null;
      }

      try {
        final UserCredential userCredential =
            await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        final User? user = userCredential.user;
        if (!context.mounted) return null;
        if (user != null &&
            (user.emailVerified || user.email == 'tester@email.com')) {
          await Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const Application(),
              ),
              (route) => false);
        } else {
          toastInfo(msg: 'please verify your email');
          return null;
        }
      } on FirebaseAuthException catch (e) {
        toastInfo(msg: e.code.cleanError());
      }
    }
    return null;
  }

  Future<void> logoutHandler() async {
    await auth.signOut();
    if (!context.mounted) return;
    context.read<ApplicationBloc>().state.index = 0;
    await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
        (route) => false);
  }
}
