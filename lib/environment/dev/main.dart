import 'package:environment_setup/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../app_env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvInfo.initialize(AppEnvironment.DEV);

  // firebase
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: EnvInfo.firebaseApiKey,
        appId: EnvInfo.firebaseAppId,
        messagingSenderId: EnvInfo.firebaseMessagingId,
        projectId: EnvInfo.firebaseProjectId,
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const Home());
}
