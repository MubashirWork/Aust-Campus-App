import 'dart:async';

import 'package:aust_campus/core/constants/app_colors.dart';
import 'package:aust_campus/core/widgets/custom_background_container.dart';
import 'package:aust_campus/core/widgets/custom_loading_indicator.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:aust_campus/features/auth/screens/login_screen.dart';
import 'package:aust_campus/features/auth/screens/register_screen.dart';
import 'package:aust_campus/features/auth/widgets/auth_container.dart';
import 'package:aust_campus/features/auth/widgets/auth_elevated_button.dart';
import 'package:aust_campus/features/auth/widgets/auth_text_button.dart';
import 'package:aust_campus/features/auth/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // UI States
  bool hideNewPassword = true;
  bool hideConfirmPassword = true;
  bool isLoading = false;

  // Toggle password visibility
  void togglePasswordVisibility() {
    setState(() {
      hideNewPassword = !hideNewPassword;
    });
  }

  // Toggle confirm password visibility
  void togConPasVis() {
    setState(() {
      hideConfirmPassword = !hideConfirmPassword;
    });
  }

  // Disposes to avoid memory leakage
  @override
  void dispose() {
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
                      'Forgot Password',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16),

                    // Forgot-password container
                    AuthContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            'Enter Your Email Below',
                            fontSize: 14,
                            color: AppColors.textHalfWhite,
                            textAlign: TextAlign.start,
                          ),
                          AuthTextField(
                            controller: emailController,
                            hint: const CustomText(
                              'mub@gmail.com',
                              fontSize: 16,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),

                          const SizedBox(height: 8),

                          CustomText(
                            'Enter New Password Below',
                            fontSize: 14,
                            color: AppColors.textHalfWhite,
                            textAlign: TextAlign.start,
                          ),
                          AuthTextField(
                            controller: newPasswordController,
                            obscureText: hideConfirmPassword,
                            hint: const CustomText(
                              '* * * * * * * *',
                              fontSize: 16,
                            ),
                            suffixIcon: hideNewPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            iconOnClick: togglePasswordVisibility,
                          ),

                          const SizedBox(height: 8),

                          CustomText(
                            'Please Confirm Password Below',
                            fontSize: 14,
                            color: AppColors.textHalfWhite,
                            textAlign: TextAlign.start,
                          ),
                          AuthTextField(
                            controller: confirmPasswordController,
                            obscureText: hideNewPassword,
                            hint: const CustomText(
                              '* * * * * * * *',
                              fontSize: 16,
                            ),
                            suffixIcon: hideConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            iconOnClick: togConPasVis,
                          ),
                        ],
                      ),
                    ),

                    // Forgot password text
                    Align(
                      alignment: Alignment.centerRight,
                      child: AuthTextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: CustomText(
                          "Don't have an account? Register",
                          color: AppColors.textHalfWhite,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Update button
                    AuthElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: CustomText(
                              'Password updated successfully',
                            ),
                          ),
                        );
                        Timer(Duration(milliseconds: 300), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        });
                      },
                      child: isLoading
                          ? const LoadingIndicator()
                          : const CustomText(
                              'Update',
                              fontWeight: FontWeight.w500,
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
