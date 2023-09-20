import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning_platform/application/chat/chat.dart';
import 'package:learning_platform/application/course/course.dart';
import 'package:learning_platform/application/home/home.dart';
import 'package:learning_platform/application/profile/profile.dart';
import 'package:learning_platform/application/search/search.dart';
import 'package:learning_platform/auth/login/views/login.dart';
import 'package:learning_platform/constants/constants.dart';

Widget reusablePage({
  required BuildContext context,
  required String imgPath,
  required String title,
  required String subTitle,
  required int index,
  required String btnName,
  required PageController pageController,
}) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.h,
        child: Image.asset(
          imgPath,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.h),
        child: SizedBox(
          height: 70.h,
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () async {
          if (index < 2) {
            await pageController.animateToPage(
              index + 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
            );
          } else {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const Login(),
              ),
              (_) => false,
            );
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 40.h),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27.w),
            boxShadow: const [],
            color: Constants.primaryElement,
          ),
          child: Center(
            child: Text(
              btnName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

AppBar buildAppBar({Widget? leading, Widget? trailing, String text = ''}) {
  return AppBar(
    // leading: leading,
    foregroundColor: Colors.black,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(10.h),
      child: Container(
        color: Colors.black.withOpacity(0.2),
        height: 0.1.h,
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 35.w,
          child: leading,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          width: 35.w,
          child: trailing,
        )
      ],
    ),
  );
}

Widget providerIcon(iconPath) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.h,
      width: 40.w,
      child: Image.asset('assets/icons/$iconPath.png'),
    ),
  );
}

Widget buildTextField({
  TextEditingController? textEditingController,
  required String icon,
  required String hint,
  required String type,
  required void Function(String input) func,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(
          type,
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      Container(
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.w),
          ),
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(14.w),
              child: Image.asset('assets/icons/$icon.png'),
            ),
            SizedBox(
              width: 245.w,
              child: type == 'username' || type == 'email'
                  ? TextField(
                      controller: textEditingController,
                      style: TextStyle(fontSize: 14.sp),
                      onChanged: (input) => func(input),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        border: InputBorder.none,
                      ),
                      enableSuggestions: false,
                      autocorrect: false,
                    )
                  : TextField(
                      style: TextStyle(fontSize: 10.sp),
                      cursorHeight: 16.h,
                      onChanged: (input) => func(input),
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        border: InputBorder.none,
                      ),
                      obscureText: true,
                      obscuringCharacter: '●',
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
            )
          ],
        ),
      ),
    ],
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 60.h),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot password ?',
        style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.normal,
          fontSize: 13.sp,
        ),
      ),
    ),
  );
}

Widget reusableButton(String buttonName, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: Constants.primaryElement,
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

Future<bool?> toastInfo({
  required msg,
  Color backgroundColor = Colors.black87,
  Color textColor = Colors.white,
}) async {
  return await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 3,
    gravity: ToastGravity.TOP,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.sp,
  );
}

BottomNavigationBarItem bottomNavigationBarItem({
  required String label,
  required String icon,
}) {
  return BottomNavigationBarItem(
    label: label,
    activeIcon: Image.asset(
      'assets/icons/$icon.png',
      color: Constants.primaryElement,
      height: 20.h,
      width: 20.w,
    ),
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        'assets/icons/$icon.png',
      ),
    ),
  );
}

List<BottomNavigationBarItem> bottomItems() {
  return [
    bottomNavigationBarItem(label: 'Home', icon: 'home'),
    bottomNavigationBarItem(label: 'Search', icon: 'search2'),
    bottomNavigationBarItem(label: 'Course', icon: 'play-circle1'),
    bottomNavigationBarItem(label: 'Chat', icon: 'message-circle'),
    bottomNavigationBarItem(label: 'Profile', icon: 'person'),
  ];
}

Widget buildPage({required int index}) {
  List<Widget> widgets = [
    const Home(),
    const Search(),
    const Course(),
    const Chat(),
    const Profile(),
  ];
  return widgets[index];
}

Widget profilePic() {
  return Container(
    height: 100,
    width: 100,
    margin: EdgeInsets.only(top: 50.h, bottom: 10.h),
    alignment: Alignment.bottomRight,
    decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/hero.jpg',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50.w))),
    child: Container(
      decoration: BoxDecoration(
        color: Constants.primaryElement,
        borderRadius: BorderRadius.circular(20.w),
      ),
      // color: Colors.blue,
      child: Image.asset(
        'assets/icons/edit.png',
        width: 30.w,
      ),
    ),
  );
}

Widget profileText({
  String text = 'Username',
  Color color = Colors.black,
  int fontSize = 18,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 40.h, top: 8),
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
      ),
    ),
  );
}

Widget buildListView({required BuildContext context}) {
  return Column(
    children: List.generate(
      Constants.map.length,
      (index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              Constants.profileRoutes[index],
            );
          },
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              bottom: 12.h,
              right: 25.w,
            ),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 37.h,
                  padding: EdgeInsets.all(7.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: Constants.primaryElement,
                  ),
                  child: Image.asset(
                    'assets/icons/${Constants.map.values.elementAt(index)}',
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  Constants.map.keys.elementAt(index),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
