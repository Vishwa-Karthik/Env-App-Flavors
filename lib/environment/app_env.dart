// ignore_for_file: constant_identifier_names, use_setters_to_change_properties, avoid_classes_with_only_static_members
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppEnvironment { DEV, PROD }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;

  static Future<void> initialize(AppEnvironment environment) async {
    EnvInfo._environment = environment;
    await dotenv.load(fileName: 'lib/environment/$envName/.env');
  }

  static String get envName => _environment._envName;
  static String get baseUrl => dotenv.get('baseUrl');
  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.PROD;
}

extension _EnvProperties on AppEnvironment {
  static const _envs = {
    AppEnvironment.DEV: 'dev',
    AppEnvironment.PROD: 'prod',
  };

  String get _envName => _envs[this]!;
}
