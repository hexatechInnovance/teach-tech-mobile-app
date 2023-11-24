import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_tech_mobile/falvors/build_config.dart';
import 'package:teach_tech_mobile/falvors/env_config.dart';
import 'routes/app_pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.envConfig;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _envConfig.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: _envConfig.appName.contains("Dev") ? true : false,
    );
  }
}
