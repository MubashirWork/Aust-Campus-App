import 'package:aust_campus/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// Custom text
class CustomText extends StatelessWidget {
  final String data;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final int maxLines;

  const CustomText(
    this.data, {
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = AppColors.textLight,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: TextOverflow.ellipsis
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
