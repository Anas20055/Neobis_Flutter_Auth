import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/app/domain/provider/auth_provider.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_buttton.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_field.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_text_button.dart';
import 'package:provider/provider.dart';

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
    final authProvider = Provider.of<AuthProvider>(context); 
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
                  controller: passwordConfController,
                  labelText: 'Confirm Password',
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                AppButton(
                  onPressed: () async{
                    if (formKey.currentState?.validate() != true) return;

                    if (passwordController.text != passwordConfController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Пароли не совпадают")));
                    }
                     else {
                      try {
                  await authProvider.signup(
                    emailController.text,
                    passwordController.text,
                  );
                  // Navigate to home screen or show a success message
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Успешное регистрация '),
                    ),
                  );
                } catch (e) {
                  // Handle registration error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
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
