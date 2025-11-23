import 'package:aust_campus/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AuthElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const AuthElevatedButton({
    required this.onPressed,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        //padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        minimumSize: Size(double.infinity, 50),
        foregroundColor: AppColors.textHalfWhite,
        backgroundColor: AppColors.primaryGradientStart,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: child,
    );
  }
}
