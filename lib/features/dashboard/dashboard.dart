import 'package:aust_campus/core/constants/app_assets.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:aust_campus/features/courses/course_screen.dart';
import 'package:aust_campus/features/dashboard/model/dashboard_items.dart';
import 'package:aust_campus/features/drawer/app_drawer.dart';
import 'package:aust_campus/features/examAndGrades/exam_grades_screen.dart';
import 'package:aust_campus/features/notices/notice_screen.dart';
import 'package:aust_campus/features/profile/profile_screen.dart';
import 'package:aust_campus/features/setting/setting_screen.dart';
import 'package:aust_campus/features/timetable/timetable_screen.dart';
import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  // Dashboard menu items
  final List<Items> dashboardItems = [
    Items(icon: Icons.book, label: 'Courses', color: AppColors.electricIndigo),
    Items(
      icon: Icons.calendar_month,
      label: 'Timetable',
      color: AppColors.dodgerBlue,
    ),
    Items(
      icon: Icons.notifications,
      label: 'Notices',
      color: AppColors.vividOrange,
    ),
    Items(
      icon: Icons.local_library,
      label: 'Exams & Grades',
      color: AppColors.persimmon,
    ),
    Items(icon: Icons.person, label: 'Profile', color: AppColors.azureRadiance),
    Items(icon: Icons.settings, label: 'Settings', color: AppColors.skyBlue),
  ];

  // Screens for each dashboard
  final List<Widget Function()> screens = [
    () => const CourseScreen(),
    () => const TimetableScreen(),
    () => const NoticeScreen(),
    () => const ExamGradeScreen(),
    () => const ProfileScreen(),
    () => const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: CustomText(
          'Abbottabad University',
          color: AppColors.textLight,
          fontWeight: FontWeight.bold,
          maxLines: 1,
          fontSize: 18,
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Icon(Icons.menu, color: AppColors.textLight, size: 28),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(AppAssets.dashboardLogo, height: 40, width: 40),
          ),
        ],
      ),
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: dashboardItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width < 600 ? 2 : 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final item = dashboardItems[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => screens[index]()),
                  );
                },
                child: Card(
                  color: AppColors.primaryGradientEnd,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: item.color,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            item.icon,
                            size: 28,
                            color: AppColors.textLight,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomText(
                          item.label,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textLight,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
