import 'package:aust_campus/features/courses/course_screen.dart';
import 'package:aust_campus/features/dashboard/dashboard.dart';
import 'package:aust_campus/features/profile/profile_screen.dart';
import 'package:aust_campus/features/timetable/timetable_screen.dart';
import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  // Current index
  int _selectedIndex = 0;

  // All screens
  final _screens = [
    Dashboard(),
    CourseScreen(),
    TimetableScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.darkBlue,
        selectedItemColor: AppColors.textLight,
        unselectedItemColor: AppColors.accentBlue,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: '',
          ),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
