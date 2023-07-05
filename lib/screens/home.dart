import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../features/auth_service/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          //logout
          IconButton(
            onPressed: () {
              _authService.signOut(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.powerOff,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(child: Text("Logged in Successfully")),
    );
  }
}
