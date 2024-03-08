import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/app/presentation/screens/register_screen.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_buttton.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_field.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextButton(
                  'Sing In',
                  isActive: true,
                  onPressed: () {},
                ),
                AppTextButton(
                  'Sing Up',
                  isActive: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) {
                          return const RegisterScreen();
                        },
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 80,
                ),
                AppTextField(
                  controller: emailController,
                  labelText: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  obsecureText: true,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 185),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontFamily: 'Popping',
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AppButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      
                    }
                  },
                  labelText: 'Sing In',
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                        fontFamily: 'Popping',
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
