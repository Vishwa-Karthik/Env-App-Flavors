import 'package:environment_setup/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../app_env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvInfo.initialize(AppEnvironment.PROD);
  await Firebase.initializeApp();
  runApp(const Home());
}
