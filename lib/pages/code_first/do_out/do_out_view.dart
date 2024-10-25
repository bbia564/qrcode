import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'do_out_logic.dart';

class DoOutView extends GetView<PageLogic> {
  const DoOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.zulauf.value
              ? const CircularProgressIndicator(color: Colors.blueGrey)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.elamzkvq();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
