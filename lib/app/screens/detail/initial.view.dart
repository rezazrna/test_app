import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'initial.controller.dart';

class InitialScreen extends StatelessWidget {
  InitialScreen({ super.key });

  final InitialController controller = Get.put(InitialController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}