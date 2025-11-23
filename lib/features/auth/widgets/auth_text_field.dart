import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? hint;
  final IconData? suffixIcon;
  final VoidCallback? iconOnClick;
  final TextInputType keyboardType;


  const AuthTextField({
    this.controller,
    this.obscureText = false,
    this.hint,
    this.suffixIcon,
    this.iconOnClick,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hint: hint,
        border: InputBorder.none,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: iconOnClick,
                child: Icon(suffixIcon, color: AppColors.textLight),
              )
            : null,
      ),
      style: TextStyle(color: AppColors.textLight),
      maxLines: 1,
      keyboardType: keyboardType,
    );
  }
}
