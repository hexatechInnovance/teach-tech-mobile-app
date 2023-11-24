import 'package:flutter/cupertino.dart';
import 'package:teach_tech_mobile/falvors/build_config.dart';
import 'package:teach_tech_mobile/falvors/env_config.dart';
import 'package:teach_tech_mobile/falvors/environment.dart';
import 'package:teach_tech_mobile/app/my_app.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "Teach Tech Dev",
    baseUrl: "",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    environment: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const MyApp());
}
