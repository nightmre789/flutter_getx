import 'package:{{name}}/constants/common/theme_constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'routes/routes.dart';

void main() async {
  runApp(Main(initialRoute: Routes.initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main({
    Key? key,
    required this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "base_app",
      initialRoute: initialRoute,
      getPages: Routes.routes,
      theme: AppTheme.appTheme,
    );
  }
}
