import 'package:aust_campus/core/constants/app_colors.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:aust_campus/features/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData leadingIcon;
  final String data;
  final IconData? trailingIcon;

  const CustomAppBar({
    this.leadingIcon = Icons.arrow_back_outlined,
    required this.data,
    this.trailingIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigation()),
          );
        },
        child: Icon(leadingIcon, color: AppColors.textLight, size: 28,),
      ),
      backgroundColor: AppColors.richMediumBlue,
      title: CustomText(data, fontSize: 20, fontWeight: FontWeight.bold),
      actions: [
        ?trailingIcon != null
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(trailingIcon, color: AppColors.textLight),
              )
            : null,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
