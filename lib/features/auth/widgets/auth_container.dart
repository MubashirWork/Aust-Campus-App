import 'package:aust_campus/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


/// Container for authorization screens
class AuthContainer extends StatelessWidget {

  final Widget? child;

  const AuthContainer({this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.accentBlue),
      child: child,
    );
  }
}
