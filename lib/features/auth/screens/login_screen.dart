import 'dart:async';

import 'package:aust_campus/core/constants/app_colors.dart';
import 'package:aust_campus/core/widgets/custom_background_container.dart';
import 'package:aust_campus/core/widgets/custom_loading_indicator.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:aust_campus/features/auth/screens/forgot_password_screen.dart';
import 'package:aust_campus/features/auth/screens/register_screen.dart';
import 'package:aust_campus/features/auth/widgets/auth_container.dart';
import 'package:aust_campus/features/auth/widgets/auth_elevated_button.dart';
import 'package:aust_campus/features/auth/widgets/auth_text_button.dart';
import 'package:aust_campus/features/auth/widgets/auth_text_field.dart';
import 'package:aust_campus/features/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Controllers
  TextEditingController rollNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // UI state
  bool hidePassword = true;
  bool isLoading = false;

  // Toggle password visibility
  void togglePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  // Dispose controller to avoid memory leaks
  @override
  void dispose() {
    rollNoController.dispose();
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
            padding: EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: safeHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Title text
                    CustomText(
                      'Welcome Back',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16),

                    // Login input fields
                    AuthContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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

                    // Forgot password text
                    Align(
                      alignment: Alignment.centerRight,
                      child: AuthTextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: CustomText(
                          'Forgot Password',
                          color: AppColors.textHalfWhite,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Login button
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
                          : const CustomText('Login', fontWeight: FontWeight.w500),
                    ),

                    SizedBox(height: 16),

                    // Register button
                    AuthTextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: CustomText(
                        'Register',
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