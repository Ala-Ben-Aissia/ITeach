import 'package:flutter/material.dart';
import 'package:learning_platform/common/widgets.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        text: 'Favorites',
      ),
    );
  }
}
