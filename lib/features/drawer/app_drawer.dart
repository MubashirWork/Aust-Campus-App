import 'dart:async';

import 'package:aust_campus/core/widgets/custom_elevated_button.dart';
import 'package:aust_campus/core/widgets/custom_loading_indicator.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:aust_campus/features/auth/screens/login_screen.dart';
import 'package:aust_campus/features/drawer/model/drawer_menus.dart';
import 'package:aust_campus/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  bool isLoading = false;

  // Drawer items
  List<DrawerMenu> drawerItems = [
    DrawerMenu(icon: Icons.home, title: 'Home'),
    DrawerMenu(icon: Icons.account_circle, title: 'Profile'),
    DrawerMenu(icon: Icons.settings, title: 'Setting'),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width - 180,
      backgroundColor: AppColors.textLight,
      child: Column(
        children: [
           SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(color: AppColors.vividSkyBlue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    'Menu',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 28,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),
          ),

          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(Icons.home, size: 32),
            title: CustomText(
              'Home',
              color: AppColors.textDark,
              fontSize: 18,
            ),
          ),

          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            leading: const Icon(Icons.account_circle, size: 32),
            title: CustomText(
              'Profile',
              color: AppColors.textDark,
              fontSize: 18,
            ),
          ),

          ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: CustomText('Will be update soon')),
              );
            },
            leading: Icon(Icons.settings, size: 32),
            title: CustomText(
              'Dark Mode',
              color: AppColors.textDark,
              fontSize: 18,
            ),
          ),

          ListTile(
            title: CustomElevatedButton(
              onClick: () {
                setState(() {
                  isLoading = true;
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                });
              },
              backgroundColor: AppColors.green,
              child: isLoading ? LoadingIndicator() : CustomText('Logout', fontWeight: FontWeight.w500,),
            ),
          ),
        ],
      ),
    );
  }
}
