import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/app/presentation/screens/login_screen.dart';

void main() {
  runApp(const AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen() ,
    );
  }
}
