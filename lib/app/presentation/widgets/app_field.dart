import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/app/presentation/app_const/app_const.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obsecureText;
  const AppTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obsecureText=false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obsecureText ,
      validator: isValueEmpty,
      controller: controller,
      cursorColor: Colors.lightBlue,
      maxLines: 1,
      decoration:InputDecoration(
      isDense: true,
      labelStyle:const  TextStyle(color: AppConst.myGreyColor,fontFamily: 'Popping',fontWeight: FontWeight.bold),
      labelText: labelText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      border:const  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30),),
        borderSide: BorderSide(color: Colors.grey,width: 2),
        ),
      enabledBorder: const  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30),),
        borderSide: BorderSide(color: AppConst.myGreyColor,width: 2),
        ),
      focusedBorder:const  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30),),
        borderSide: BorderSide(color: Colors.lightBlue,width: 2),
        ),
      ),
      
        
    );
  }

  String? isValueEmpty(String? value) {
    if (value?.isEmpty == true) {
      return 'Please fill form';
    }return null;
  }
}
