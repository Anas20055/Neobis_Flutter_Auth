import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/provider/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(authProvider.currentUser?.usrEmail?? 'Ошибка'),
            Image.network('https://risovach.ru/upload/2014/09/mem/chernyj-vlastelin_61126467_orig_.jpg'),
          ],
        ),
      )
    );
  }
}