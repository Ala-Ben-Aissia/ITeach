import 'package:flutter/material.dart';
import 'package:learning_platform/common/widgets.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        text: 'Payment',
      ),
    );
  }
}
