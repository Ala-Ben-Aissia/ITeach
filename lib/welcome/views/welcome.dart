import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_platform/common/widgets.dart';
import 'package:learning_platform/constants/constants.dart';
import 'package:learning_platform/welcome/bloc/welcome_bloc.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (pageIndex) {
                    state.index = pageIndex;
                    context.read<WelcomeBloc>().add(WelcomeEvent());
                  },
                  children: [
                    reusablePage(
                      context: context,
                      index: 0,
                      imgPath: 'assets/images/reading.png',
                      title: 'Learning With Ala',
                      subTitle:
                          'Let\'s jump into an amazing learning journey\nI\'ll be guiding you through a lot of topics\nGet ready to reach another level',
                      btnName: 'Welcome',
                      pageController: pageController,
                    ),
                    reusablePage(
                      context: context,
                      index: 1,
                      imgPath: 'assets/images/man.png',
                      title: 'Connect With Everyone',
                      subTitle:
                          'Always keep in touch with me and your friends\nLet\'s get connected!',
                      btnName: 'Next',
                      pageController: pageController,
                    ),
                    reusablePage(
                      context: context,
                      index: 2,
                      imgPath: 'assets/images/boy.png',
                      title: 'Flexibility',
                      subTitle:
                          'Anywhere, the time is at your discretion\nSo study whenever you want!',
                      btnName: 'Get Started',
                      pageController: pageController,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 70,
                  child: DotsIndicator(
                    mainAxisAlignment: MainAxisAlignment.center,
                    position: state.index,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      color: Constants.primaryThreeElementText,
                      activeColor: Constants.primaryElement,
                      activeSize: Size(20.w, 6.h),
                      activeShape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2.w),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
