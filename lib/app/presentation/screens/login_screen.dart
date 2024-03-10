import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/app/domain/provider/auth_provider.dart';
import 'package:neobis_flutter_auth/app/presentation/screens/home_page.dart';
import 'package:neobis_flutter_auth/app/presentation/screens/register_screen.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_buttton.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_field.dart';
import 'package:neobis_flutter_auth/app/presentation/widgets/app_text_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(text: 'atambaev3@gmail.com');
  final passwordController = TextEditingController(text: 'Atambaev3@');
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    passwordController.dispose();
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
                  onPressed: () async {
                    if (formKey.currentState?.validate() == true) {
                      try {
                        await authProvider.login(
                            emailController.text,
                            passwordController
                                .text);
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                      }
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
