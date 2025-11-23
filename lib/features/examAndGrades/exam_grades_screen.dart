import 'package:aust_campus/core/widgets/custom_app_bar.dart';
import 'package:aust_campus/core/widgets/custom_background_container.dart';
import 'package:aust_campus/core/widgets/custom_card.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:aust_campus/features/examAndGrades/model/exam_items.dart';
import 'package:aust_campus/features/examAndGrades/model/grade_items.dart';
import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class ExamGradeScreen extends StatefulWidget {
  const ExamGradeScreen({super.key});

  @override
  State<ExamGradeScreen> createState() => _ExamGradeState();
}

class _ExamGradeState extends State<ExamGradeScreen> {

  // Grade list
  final List<GradeItems> gradeItemList = const [
    GradeItems(semester: '1st', cgpa: 2.48),
    GradeItems(semester: '2nd', cgpa: 3.56),
    GradeItems(semester: '3rd', cgpa: 3.23),
    GradeItems(semester: '4th', cgpa: 3.94),
    GradeItems(semester: 'Whole Cgpa', cgpa: 3.33),
  ];

  // Exam list
  final List<ExamItems> examItemList = const [
    ExamItems(
      subject: 'Operating System',
      date: '26 Nov 9:00 AM to 10:00 AM',
      venue: 'G9',
    ),
    ExamItems(
      subject: 'Software Requirement Engineering',
      date: '27 Nov 9:00 AM to 10:00 AM',
      venue: 'G25',
    ),
    ExamItems(
      subject: 'Introduction to Psychology',
      date: '28 Nov 12:00 PM tp 1:00 PM',
      venue: 'G20',
    ),
    ExamItems(
      subject: 'Software Quality Engineering',
      date: '01 Dec 12:00 PM to 1:00 PM',
      venue: 'G23',
    ),
    ExamItems(
      subject: 'Agent Based Software Engineering',
      date: '02 Dec 12:00 PM to 1:00 PM',
      venue: 'G8',
    ),
    ExamItems(
      subject: 'Software Engineering Economics',
      date: '03 Dec 12:00 PM to 1:00 PM',
      venue: 'G12',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(data: 'Exam & Grades'),
      body: SafeArea(
        child: CustomBackgroundContainer(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [_gpaSection(), SizedBox(height: 16), _examSection()],
          ),
        ),
      ),
    );
  }

  // Gpa Section
  Widget _gpaSection() {
    return CustomCard(
      color: AppColors.textLight,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              'GPA',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),

            const SizedBox(height: 8),

            SizedBox(
              height: 70,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 28),
                scrollDirection: Axis.horizontal,
                itemCount: gradeItemList.length,
                itemBuilder: (context, index) {
                  final item = gradeItemList[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            item.semester,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textDark,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            "${item.cgpa}",
                            color: AppColors.textDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Exam section
  Widget _examSection() {
    return CustomCard(
      color: AppColors.textLight,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              'Upcoming Exams',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 300,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: examItemList.length,
                itemBuilder: (context, index) {
                  final examItems = examItemList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        examItems.subject,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDark,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(examItems.date, color: AppColors.textDark),
                          CustomText(
                            examItems.venue,
                            color: AppColors.textDark,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 1.0,
                              color: Colors.black12,
                              minHeight: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
