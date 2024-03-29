import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/app/presentation/app_const/app_const.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obsecureText;
  const AppTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.obsecureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      validator: obsecureText? validatePassword : isValidEmail,
      controller: controller,
      cursorColor: Colors.lightBlue,
      maxLines: 1,
      decoration: InputDecoration(
        isDense: true,
        labelStyle: const TextStyle(
            color: AppConst.myGreyColor,
            fontFamily: 'Popping',
            fontWeight: FontWeight.bold),
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(color: AppConst.myGreyColor, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(color: Colors.lightBlue, width: 2),
        ),
      ),
    );
  }

  String? isValueEmpty(String? value) {
    if (value?.isEmpty == true) {
      return 'Please fill form';
    }
    return null;
  }
}

String? validatePassword(String? value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value?.isEmpty == true) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value!)) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }
}

String? isValidEmail(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
      .hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null; 
}
