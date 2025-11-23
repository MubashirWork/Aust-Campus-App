import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.vividSkyBlue),
    );

    return TextField(
      style: TextStyle(color: AppColors.textLight),
      decoration: InputDecoration(
        hint: CustomText('Search', color: AppColors.textLight, fontSize: 16),
        suffixIcon: Icon(Icons.search, color: AppColors.textLight),
        filled: true,
        fillColor: AppColors.vividSkyBlue,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
