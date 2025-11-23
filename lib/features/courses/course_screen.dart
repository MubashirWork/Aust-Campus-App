import 'package:aust_campus/core/widgets/custom_app_bar.dart';
import 'package:aust_campus/core/widgets/custom_background_container.dart';
import 'package:aust_campus/core/widgets/custom_card.dart';
import 'package:aust_campus/core/widgets/custom_search_field.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:aust_campus/features/courses/model/course_items.dart';
import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {

  // Courses list
  List<Course> courseItems = [
    Course(
      courseTitle: 'SEE310: Agent Based Software Engineering',
      completePerc: 60,
      color: Color(0xFF4CAF50),
    ),
    Course(
      courseTitle: 'PSY111: Introduction to Psychology',
      completePerc: 40,
      color: Color(0xFF2196F3),
    ),
    Course(
      courseTitle: 'CC310: Operating System',
      completePerc: 61,
      color: Color(0xFFFF9800),
    ),
    Course(
      courseTitle: 'SEE311: Software Engineering Economics',
      completePerc: 56.9,
      color: Color(0xFF9C27B0),
    ),
    Course(
      courseTitle: 'SEC311: Software Quality Engineering',
      completePerc: 30,
      color: Color(0xFFF44336),
    ),
    Course(
      courseTitle: 'SEE312: Software Requirement Engineering',
      completePerc: 72,
      color: Color(0xFF00BCD4),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(data: 'My Courses'),
      body: SafeArea(
        child: CustomBackgroundContainer(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomSearchField(),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: courseItems.length,
                    itemBuilder: (context, index) {
                      var myItem = courseItems[index];
                      return CustomCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              myItem.courseTitle,
                              color: AppColors.textDark,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 8),
                            CustomText(
                              'Course Completion',
                              color: AppColors.textDark,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: LinearProgressIndicator(
                                    color: myItem.color,
                                    value: myItem.completePerc / 100,
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                CustomText(
                                  '${myItem.completePerc}',
                                  fontSize: 14,
                                  color: AppColors.textDark,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
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
