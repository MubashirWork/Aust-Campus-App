import 'package:aust_campus/core/widgets/custom_app_bar.dart';
import 'package:aust_campus/core/widgets/custom_background_container.dart';
import 'package:aust_campus/core/widgets/custom_card.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  // Settings items
  List<String> settingItems = [
    'Account Settings',
    'Push Notifications',
    'Remainders',
    'Privacy And Setting',
    'Help And Support',
    'About App',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        data: 'Setting',
        trailingIcon: Icons.notifications,
      ),
      body: SafeArea(
        child: CustomBackgroundContainer(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 16,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.textLight,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.settings, color: AppColors.textDark, size: 28,),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final items = settingItems[index];
                      return CustomCard(
                        color: AppColors.textLight,
                        child: CustomText(
                          items,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: settingItems.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
