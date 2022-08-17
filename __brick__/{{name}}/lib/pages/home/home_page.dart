import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:{{name}}/controllers/home/home_controller.dart';

import 'package:{{name}}/constants/home/page_content.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pageTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(pushButtonText),
            Obx(() => Text(controller.count.toString())),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Get.toNamed("/other"),
              child: const Text(otherPageButtonText),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCount,
        tooltip: buttonTooltip,
        child: const Icon(Icons.add),
      ), //
    );
  }
}
