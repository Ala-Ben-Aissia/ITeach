import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_platform/application/bloc/application_bloc.dart';
import 'package:learning_platform/application/profile/achievements.dart';
import 'package:learning_platform/application/profile/favorites.dart';
import 'package:learning_platform/application/profile/payment.dart';
import 'package:learning_platform/application/profile/reminders.dart';
import 'package:learning_platform/application/profile/settings.dart';
import 'package:learning_platform/auth/login/bloc/login_bloc.dart';
import 'package:learning_platform/auth/register/bloc/register_bloc.dart';
import 'package:learning_platform/welcome/bloc/welcome_bloc.dart';
import 'package:learning_platform/welcome/views/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => ApplicationBloc(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(
        pageController: PageController(),
      ),
      routes: {
        '/settings': (context) => const Settings(),
        '/payment': (context) => const Payment(),
        '/achievement': (context) => const Achievements(),
        '/favorites': (context) => const Favorites(),
        '/reminders': (context) => const Reminders(),
      },
    );
  }
}
