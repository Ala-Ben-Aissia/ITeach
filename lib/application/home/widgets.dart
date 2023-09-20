import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_platform/constants/constants.dart';
import 'package:learning_platform/welcome/bloc/welcome_bloc.dart';

AppBar homeAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.h,
          width: 20.w,
          child: Image.asset('assets/icons/menu.png'),
        ),
        GestureDetector(
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/img.png'),
              ),
            ),
          ),
          onTap: () {},
        )
      ],
    ),
  );
}

Widget homeText(
    {required String text, Color color = Colors.black, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(
      top: top.h,
    ),
    child: Text(
      text,
      style: TextStyle(
          fontSize: 24.sp,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          color: color),
    ),
  );
}

Row searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 40.h,
        width: 260.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
              ),
              width: 20.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            Container(
              padding: EdgeInsets.all(1.h),
              height: 40.h,
              width: 200.w,
              child: TextField(
                onChanged: (input) {},
                decoration: const InputDecoration(
                  hintText: 'hint',
                  hintStyle: TextStyle(
                    color: Colors.black45,
                  ),
                  border: InputBorder.none,
                ),
                autocorrect: false,
              ),
            )
          ],
        ),
      ),
      Container(
        height: 37.h,
        width: 37.w,
        decoration: BoxDecoration(
          color: Constants.primaryElement,
          borderRadius: BorderRadius.circular(8.h),
          border: Border.all(color: Constants.primaryElement),
        ),
        child: Image.asset('assets/icons/options.png'),
      ),
    ],
  );
}

Widget buildSliders(BuildContext context) {
  return BlocBuilder<WelcomeBloc, WelcomeState>(
    builder: (context, state) {
      return Column(
        children: [
          SizedBox(
            height: 140.h,
            width: 325.w,
            child: PageView(
              onPageChanged: (value) {
                state.index = value;
                context.read<WelcomeBloc>().add(WelcomeEvent());
              },
              children: [
                _sliderContainer(),
                _sliderContainer(path: 'assets/icons/Image(1).png'),
                _sliderContainer(path: 'assets/icons/Image(2).png'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 1.h,
            ),
          ),
          DotsIndicator(
            decorator: DotsDecorator(
              size: Size(14.w, 5.h),
              activeColor: Constants.primaryElement,
              activeSize: Size(14.w, 5.h),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            dotsCount: 3,
            mainAxisAlignment: MainAxisAlignment.center,
            position: state.index,
          ),
        ],
      );
    },
  );
}

Widget _sliderContainer({String path = 'assets/icons/Art.png'}) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          path,
        ),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget buildMenu() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 7.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _reusableMenuText(
              text: 'Choose your course',
              fonSize: 16,
              fontWeight: FontWeight.bold,
            ),
            GestureDetector(
              onTap: () {},
              child: _reusableMenuText(
                text: 'See All',
                fonSize: 12,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            reusableButton(
              text: 'All',
              color: Colors.white,
              bgColor: Constants.primaryElement,
            ),
            reusableButton(text: 'Popular'),
            reusableButton(text: 'Newest'),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableMenuText({
  String text = 'TEXT',
  int fonSize = 12,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.black,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fonSize.sp,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

Widget reusableButton(
    {String text = 'helloooo',
    Color color = Colors.grey,
    Color bgColor = Colors.white}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(9.w),
      ),
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h, bottom: 5.h),
      child: _reusableMenuText(
          text: text, color: color, fontWeight: FontWeight.w500),
    ),
  );
}

Widget coursesGrid() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/icons/image(4).png'),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 12.w,
            bottom: 3.h,
          ),
          child: Text(
            'Advanced Django',
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 12.w,
            bottom: 8.h,
          ),
          child: Text(
            '14 Lessons',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
