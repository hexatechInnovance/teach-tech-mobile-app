import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'flavors.dart';

void mainApp() {
  Color appBarColor = Colors.black;
  if (F.appFlavor == Flavor.DEV) {
    appBarColor = Colors.transparent;
  } else if (F.appFlavor == Flavor.STG) {
    appBarColor = Colors.green;
  } else if (F.appFlavor == Flavor.PROD) {
    appBarColor = Colors.pink;
  }

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: appBarColor)),
    ),
  );
}
