import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Widget? child;
  final double margin;

  const CustomCard({this.color = AppColors.softWhite, this.child, this.margin = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 0),
      color: color,
      child: Padding(padding: EdgeInsets.all(16), child: child),
    );
  }
}
