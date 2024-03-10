import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/app/domain/provider/auth_provider.dart';
import 'package:neobis_flutter_auth/app/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> AuthProvider(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home:const  LoginScreen(),
      ),
    );
  }
}


