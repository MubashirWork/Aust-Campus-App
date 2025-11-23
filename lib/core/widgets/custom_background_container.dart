import 'package:aust_campus/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CustomBackgroundContainer extends StatelessWidget {
  final List<Color> colors;
  final Alignment begin;
  final Alignment end;
  final Widget? child;

  const CustomBackgroundContainer({
    this.colors = const [
      AppColors.richMediumBlue,
      AppColors.brightCyan,
      AppColors.brightCyan,
    ],
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors, begin: begin, end: end),
      ),
      child: child,
    );
  }
}
