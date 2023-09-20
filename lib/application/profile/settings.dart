import 'package:flutter/material.dart';
import 'package:learning_platform/common/widgets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        text: 'Settings',
      ),
    );
  }
}
