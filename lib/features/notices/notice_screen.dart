import 'package:aust_campus/core/widgets/custom_app_bar.dart';
import 'package:aust_campus/core/widgets/custom_background_container.dart';
import 'package:aust_campus/core/widgets/custom_card.dart';
import 'package:aust_campus/core/widgets/custom_search_field.dart';
import 'package:aust_campus/core/widgets/custom_text.dart';
import 'package:aust_campus/features/notices/model/notice_items.dart';
import 'package:flutter/material.dart';
import 'package:aust_campus/core/constants/app_colors.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {


  // Notice list
  List<NoticeItems> noticeItems = const [
    NoticeItems(
      title: "Classes Reschedule",
      description:
      'Today is the last day for enrollment. Tomorrow (9:30 AM – 2:00 PM), only written applications will be accepted at the Coordinator’s Office. After that, no queries will be entertained, and a fine will apply for late enrollment.',
      date: '22 Sep 2025 1:04 PM',
    ),
    NoticeItems(
      title: "Enrollment Closure",
      description:
      'You are informed that classes will not be held from tomorrow in Department of Computer Science. You will be notified about the resumption of classes in this department in coming week.',
      date: '22 Sep 2025 12:04 AM',
    ),
    NoticeItems(
      title: "Fall 2025 Enrollment Starts",
      description: '''
Dear Students,
Course enrollment for Fall 2025 is now open and will remain active for 24 hours only. Please follow these steps:
1. Log in to your account → Enrollment Tab.
2. Current semester & section are auto-selected.
3. Note: Some sections have been merged/shortened, so your section may appear changed (e.g., E → B or C or D and B → A). No need to worry—these changes were made by the department.
4. Select each course from the drop-down menu → click ADD.
5. No course retakes are allowed in this semester.
6. Pre-requisite courses must be completed before regular enrollment.
7. Print your enrollment form and submit it to your CR/GR.
Queries deadline: Sept 22, 2025 (Monday)  
Enrollment locks automatically after 20-09-2025 (Saturday) 11 PM → late requests will not be entertained & fine will apply.  
For assistance, contact the coordinator office via CRs/GRs during office hours.  
Wishing you a productive semester!
''',
      date: '21 Sep 2025 9:04 PM',
    ),
    NoticeItems(
      title: "Important Survey",
      description: '''
Mandatory Student Survey – Ulster University & AUST Dual BS Degree Program.
Dear Students,
You are kindly requested to complete the survey by the end of today.
This survey is an important step toward an agreement between Ulster University (UK) and AUST (Department of Computer Science) for the launch of a UK Dual BS Degree Program/Split Program.
As this survey is initiated by Ulster University, it is mandatory for all students to participate. Your feedback will play a vital role in shaping this collaboration and ensuring the program meets academic requirements.
We appreciate your cooperation and timely response.
Best regards,
Department of Computer Science
AUST
''',
      date: '18 Sep 2025 1:04 PM',
    ),
    NoticeItems(
      title: "Azadi March",
      description:
      'Assalamualaikum! The university bus will arrive from the complex stop at 7:45 am  sharp.All of you are requested to wait at your respective stops so that you can attend the program on August 14 at 9:am.',
      date: '13 Aug 2025 8:04 PM',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        data: 'Notices',
      ),
      body: SafeArea(
        child: CustomBackgroundContainer(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                CustomSearchField(),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: noticeItems.length,
                    itemBuilder: (context, index) {
                      var myItem = noticeItems[index];
                      return CustomCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              myItem.date,
                              color: AppColors.textDark,
                              fontSize: 14,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 4),
                            CustomText(
                              myItem.title,
                              color: AppColors.textDark,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 4),
                            CustomText(
                              myItem.description,
                              color: AppColors.textDark,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 16),
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
