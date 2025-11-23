import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
        color: AppColors.textLight,
      ),
    );
  }
}
