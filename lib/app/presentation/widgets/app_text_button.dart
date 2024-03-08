import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/app/presentation/app_const/app_const.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(this.text,
      {super.key, required this.isActive, required this.onPressed});
  final VoidCallback onPressed;
  final bool isActive;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => (isActive
                ? AppConst.linearGradientBlue
                : AppConst.linearGradientgrey)
            .createShader(
          Rect.fromLTWH(
            0,
            0,
            bounds.width,
            bounds.height,
          ),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              height: 1.3,
              fontSize: 30,
              fontFamily: 'Popping',
              fontWeight: FontWeight.bold,

              
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
