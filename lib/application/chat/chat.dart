import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_platform/common/widgets.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        leading: Image.asset(
          'assets/icons/menu.png',
          height: 12.h,
        ),
        text: 'Chat',
        trailing: Image.asset(
          'assets/icons/more-vertical.png',
          height: 20.h,
        ),
      ),
      body: const Center(
        child: Text('Chat'),
      ),
    );
  }
}
