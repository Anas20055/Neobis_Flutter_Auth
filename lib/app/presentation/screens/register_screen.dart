import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_buttton.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_field.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_text_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    passwordController.dispose();
    passwordConfController.dispose();
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
                  isActive: false,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                AppTextButton(
                  'Sing Up',
                  isActive: true,
                  onPressed: () {},
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
                const SizedBox(
                  height: 20,
                ),
                AppTextField(
                  controller: passwordController,
                  labelText: 'Confirm Password',
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                AppButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                    }
                  },
                  labelText: 'Sing Up',
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
