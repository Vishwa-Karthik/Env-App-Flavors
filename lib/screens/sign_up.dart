import 'package:flutter/material.dart';

import '../core/utils/colors/colors.dart';
import '../core/utils/widgets/button.dart';
import '../core/utils/widgets/text_input.dart';
import '../features/auth_service/auth_service.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();

  // controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          //* email text
          TextInputField(
            prefixIcon: Icons.person,
            width: MediaQuery.of(context).size.width * 0.8,
            controller: _firstNameController,
            hintText: "First Name",
            keyboardType: TextInputType.name,
            maxLines: 1,
          ),
          const SizedBox(height: 20),
          //* email text
          TextInputField(
            prefixIcon: Icons.person,
            width: MediaQuery.of(context).size.width * 0.8,
            controller: _lastNameController,
            hintText: "Last Name",
            keyboardType: TextInputType.name,
            maxLines: 1,
          ),

          const SizedBox(height: 20),

          //* email text
          TextInputField(
            prefixIcon: Icons.email_rounded,
            width: MediaQuery.of(context).size.width * 0.8,
            controller: _emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
          ),

          const SizedBox(height: 20),

          //* password text
          TextInputField(
              prefixIcon: Icons.password_sharp,
              width: MediaQuery.of(context).size.width * 0.8,
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              maxLines: 1),

          const SizedBox(height: 20),

          //* confirm password text
          TextInputField(
              prefixIcon: Icons.password_outlined,
              width: MediaQuery.of(context).size.width * 0.8,
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              maxLines: 1),

          const SizedBox(height: 20),

          MyButton(
            text: "CREATE",
            onPressed: () {
              if (_passwordController == _confirmPasswordController) {
                AuthService()
                    .signUp(
                      context,
                      _emailController.text,
                      _passwordController.text,
                    )
                    .then((value) => null);
              }
            },
          ),

          const SizedBox(height: 30),

          //* divider
          Row(
            children: [
              const Expanded(
                  child: Divider(
                color: AppColors.grey,
                thickness: 1,
                indent: 40,
                endIndent: 5,
              )),
              Text("  OR  ", style: Theme.of(context).textTheme.displaySmall),
              const Expanded(
                child: Divider(
                  color: AppColors.grey,
                  thickness: 1,
                  indent: 5,
                  endIndent: 40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          //* already member
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text("Already a Member?",
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Text(
                  "SIGN IN",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.deepPurple.shade800),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
