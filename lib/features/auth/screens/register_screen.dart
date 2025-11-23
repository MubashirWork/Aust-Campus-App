import 'dart:async';

import 'package:aust_campus/core/constants/app_colors.dart';
import 'package:aust_campus/core/widgets/custom_background_container.dart';
import 'package:aust_campus/core/widgets/custom_loading_indicator.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:aust_campus/features/auth/screens/login_screen.dart';
import 'package:aust_campus/features/auth/widgets/auth_container.dart';
import 'package:aust_campus/features/auth/widgets/auth_elevated_button.dart';
import 'package:aust_campus/features/auth/widgets/auth_text_button.dart';
import 'package:aust_campus/features/auth/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:aust_campus/features/bottom_navigation/bottom_navigation.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // controllers
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // UI states
  bool hidePassword = true;
  bool isLoading = false;

  // Toggle password visibility
  void togglePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  // dispose to prevent from memory leakage
  @override
  void dispose() {
    rollNoController.dispose();
    emailController.dispose();
    cnicController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final safeHeight =
        mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;
    return Scaffold(
      body: SafeArea(
        child: CustomBackgroundContainer(
          colors: [
            AppColors.primaryGradientStart,
            AppColors.primaryGradientEnd,
            AppColors.primaryGradientEnd,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: safeHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Title text
                    CustomText(
                      'Register Here',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16),

                    // Register input text fields
                    AuthContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            'Enter Your Cnic Below',
                            fontSize: 14,
                            color: AppColors.textHalfWhite,
                            textAlign: TextAlign.start,
                          ),
                          AuthTextField(
                            controller: cnicController,
                            hint: CustomText('1015123456789', fontSize: 16),
                            keyboardType: TextInputType.number,
                          ),

                          const SizedBox(height: 8),

                          CustomText(
                            'Enter Your Email Below',
                            fontSize: 14,
                            color: AppColors.textHalfWhite,
                            textAlign: TextAlign.start,
                          ),
                          AuthTextField(
                            controller: emailController,
                            hint: CustomText('mub@gmail.com', fontSize: 16),
                            keyboardType: TextInputType.emailAddress,
                          ),

                          const SizedBox(height: 8),

                          CustomText(
                            'Enter Your Roll Number Below',
                            fontSize: 14,
                            color: AppColors.textHalfWhite,
                            textAlign: TextAlign.start,
                          ),
                          AuthTextField(
                            controller: rollNoController,
                            hint: CustomText('14979', fontSize: 16),
                            keyboardType: TextInputType.number,
                          ),

                          const SizedBox(height: 8),

                          CustomText(
                            'Enter Password Below',
                            fontSize: 14,
                            color: AppColors.textHalfWhite,
                            textAlign: TextAlign.start,
                          ),
                          AuthTextField(
                            controller: passwordController,
                            obscureText: hidePassword,
                            hint: CustomText('* * * * * * * *', fontSize: 16),
                            suffixIcon: hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            iconOnClick: togglePasswordVisibility,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Register button
                    AuthElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        Timer(Duration(milliseconds: 300), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavigation(),
                            ),
                          );
                        });
                      },
                      child: isLoading
                          ? const LoadingIndicator()
                          : const CustomText(
                              'Register',
                              fontWeight: FontWeight.w500,
                            ),
                    ),

                    const SizedBox(height: 16),

                    // Login button
                    AuthTextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: const CustomText(
                        'Login',
                        fontWeight: FontWeight.w500,
                        color: AppColors.textHalfWhite,
                      ),
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
