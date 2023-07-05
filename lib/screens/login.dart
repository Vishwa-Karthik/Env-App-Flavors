import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/utils/colors/colors.dart';
import '../core/utils/theme/theme.dart';
import '../core/utils/widgets/button.dart';
import '../core/utils/widgets/text_input.dart';
import '../core/utils/widgets/sign_ons.dart';
import '../environment/app_env.dart';
import '../features/auth_service/auth_service.dart';
import 'sign_up.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: EnvInfo.isProduction ? false : true,
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme(context),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome Back, We Missed You !",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
          ),

          const SizedBox(height: 30),

          //* email text
          TextInputField(
            prefixIcon: FontAwesomeIcons.envelope,
            width: MediaQuery.of(context).size.width * 0.8,
            controller: emailTextController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
          ),

          const SizedBox(height: 20),

          //* password text
          TextInputField(
              obscureText: true,
              prefixIcon: FontAwesomeIcons.lock,
              width: MediaQuery.of(context).size.width * 0.8,
              hintText: "Password",
              controller: passwordTextController,
              keyboardType: TextInputType.visiblePassword,
              maxLines: 1),

          const SizedBox(height: 20),

          //* forgot password
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password?",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColors.grey.shade600,
                    ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          //* login button
          MyButton(
              text: "LOGIN",
              onPressed: () => _authService.signIn(context,
                  emailTextController.text, passwordTextController.text)),

          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: AppColors.grey.shade400,
                  thickness: 1,
                  indent: 30,
                  endIndent: 5,
                ),
              ),
              Text(
                "  OR  ",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey.shade900,
                    ),
              ),
              Expanded(
                child: Divider(
                  color: AppColors.grey.shade400,
                  thickness: 1,
                  indent: 5,
                  endIndent: 30,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignOns(
                color: Colors.blue,
                assetPath: FontAwesomeIcons.phone,
                onPressed: () {},
              ),
              const SizedBox(width: 20),
              SignOns(
                assetPath: FontAwesomeIcons.google,
                color: Colors.red.shade400,
                onPressed: () {},
              ),
              const SizedBox(width: 20),
              SignOns(assetPath: FontAwesomeIcons.apple, onPressed: () {}),
            ],
          ),

          const SizedBox(height: 40),

          //* not a member
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Not a member?",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: Text(
                  "SIGN UP",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.deepPurple.shade800),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    ));
  }
}
