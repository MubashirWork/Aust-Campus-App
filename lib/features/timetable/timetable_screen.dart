import 'package:aust_campus/core/widgets/custom_app_bar.dart';
import 'package:aust_campus/core/widgets/custom_background_container.dart';
import 'package:aust_campus/core/widgets/custom_card.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:aust_campus/features/timetable/model/course_timetable.dart';
import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {

  // Timetable list
  List<CourseTimetable> timetableItems = [
    CourseTimetable(
      courseCode: 'SEE310',
      courseTitle: 'Agent Based Software Engineering',
      time: '8:00AM - 9:30AM, SSR 2',
    ),
    CourseTimetable(
      courseCode: 'CC310',
      courseTitle: 'Operating System',
      time: '9:30Am - 11:00AM, G19',
    ),
    CourseTimetable(
      courseCode: 'SEE311',
      courseTitle: 'Software Engineering Economics',
      time: '12:00PM - 1:15PM, F11',
    ),
    CourseTimetable(
      courseCode: 'SEE310',
      courseTitle: 'Software Requirement Engineering',
      time: '1:45PM - 3:00PM, G9',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(data: 'Timetable'),
      body: SafeArea(
        child: CustomBackgroundContainer(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              itemBuilder: (context, index) {
                final items = timetableItems[index];
                return CustomCard(
                  color: AppColors.textLight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.check_box,
                              color: AppColors.textLight,
                            ),
                          ),
                          const SizedBox(width: 16),
                          CustomText(
                            items.courseCode,
                            color: AppColors.textDark,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      CustomText(
                        items.courseTitle,
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      const SizedBox(height: 8),
                      CustomText(
                        items.time,
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: timetableItems.length,
            ),
          ),
        ),
      ),
    );
  }
}
