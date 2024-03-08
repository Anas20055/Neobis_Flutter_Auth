import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/app/presentation/app_const/app_const.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String labelText;
  final Color buttonColor;
  const AppButton(
      {super.key,
      required this.onPressed,
      required this.labelText,
      this.buttonColor = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 40,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          gradient: AppConst.linearGradientBlue,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: -10,
              blurRadius: 20,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(5),
            foregroundColor: Colors.white,
          ),
          onPressed: onPressed,
          child: Text(
            labelText,
            style: const TextStyle(fontSize: 18, fontFamily: 'Popping'),
          ),
        ),
      ),
    );
  }
}
