import 'package:teach_tech_mobile/falvors/env_config.dart';
import 'package:teach_tech_mobile/falvors/environment.dart';

class BuildConfig {
  late final Environment environment;
  late final EnvConfig envConfig;
  bool _lock = false;

  static final BuildConfig instance = BuildConfig._internal();

  BuildConfig._internal();

  factory BuildConfig.instantiate({
    required Environment environment,
    required EnvConfig envConfig,
  }) {
    if (instance._lock) return instance;

    instance.envConfig = envConfig;
    instance.environment = environment;
    instance._lock = true;

    return instance;
  }
}
