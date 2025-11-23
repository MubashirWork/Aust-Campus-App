import 'package:aust_campus/core/constants/app_assets.dart';
import 'package:aust_campus/core/widgets/custom_app_bar.dart';
import 'package:aust_campus/core/widgets/custom_background_container.dart';
import 'package:aust_campus/core/widgets/custom_elevated_button.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    // Safe height
    final mediaQuery = MediaQuery.of(context);
    final safeHeight =
        mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    return Scaffold(
      appBar: CustomAppBar(data: 'Profile'),
      body: SafeArea(
        child: CustomBackgroundContainer(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: safeHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Card(
                          margin: EdgeInsets.only(top: 80),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 64),
                                CustomText(
                                  'Mubashir Rafique',
                                  color: AppColors.textDark,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(height: 16),
                                CustomText(
                                  '14979',
                                  color: AppColors.textDark,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(height: 16),
                                CustomText(
                                  'Bachelor of Software Engineering',
                                  color: AppColors.textDark,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(height: 16),
                                CustomText(
                                  'Semester 5B',
                                  color: AppColors.textDark,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        minHeight: 0.5,
                                        value: 1,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.email_outlined),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: CustomText(
                                        'mubashirrafique63@gmail.com',
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.phone_outlined),
                                    SizedBox(width: 8),
                                    CustomText(
                                      '+992 3325874336',
                                      color: AppColors.textDark,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                CustomElevatedButton(
                                  onClick: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: CustomText(
                                          'Will be updated soon',
                                        ),
                                      ),
                                    );
                                  },
                                  backgroundColor: AppColors.vividSkyBlue,
                                  child: CustomText('Edit Profile', fontWeight: FontWeight.w500,),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          top: 0,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage(AppAssets.profileImage),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
