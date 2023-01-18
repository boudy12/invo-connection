import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoconnection/admin/modules/setting/all_connection/all_connection_screen.dart';
import 'package:invoconnection/admin/modules/setting/notifications/notifications_screen.dart';
import 'package:invoconnection/modules/home/home_screen.dart';
import 'package:invoconnection/modules/login/login_screen.dart';
import 'package:invoconnection/modules/setting/all_connection/all_connection_screen.dart';
import 'package:invoconnection/modules/setting/notifications/notifications_screen.dart';
import 'package:invoconnection/modules/setting/profile/profile_screen.dart';
import 'package:invoconnection/modules/setting/resume/resume_screen.dart';
import 'package:invoconnection/modules/setting/setting/setting_screen.dart';
import 'package:invoconnection/shared/components/components.dart';

import '../../admin/modules/setting/organization_profile/organization_profile_screen.dart';

class ConnectionAppSettingScreen extends StatelessWidget {

  bool? isAdmin = false;
  List<IconData> icons=[
    Icons.person,
   // Icons.file_copy,
    Icons.restore,
    Icons.notification_important_rounded,
    Icons.help_center,
    Icons.settings,
    Icons.power_settings_new_outlined,
  ];
  List<String> labels=[
    'myProfile'.tr,
    //'myResume'.tr,
    'allConnection'.tr,
    'notification'.tr,
    'helpCenter'.tr,
    'settings'.tr,
    'logout'.tr,
  ];
  List<Widget> screensUser=[
    ProfileScreen(isProfile: true),
   // ResumeScreen(),
    AllConnectionsScreen(),
    NotificationsScreen(),
    ConnectionAppHomeScreen(),
    SettingScreen(),
    ConnectionAppLoginScreen(),
  ];
  List<Widget> screensAdmin=[
    ConnectionAppOrganizationProfileScreen(isAdmin: true),
 //   ResumeScreen(),
    AllConnectionsAdminScreen(),
    NotificationsAdminScreen(),
    ConnectionAppHomeScreen(),
    SettingScreen(),
    ConnectionAppLoginScreen(),
  ];

  ConnectionAppSettingScreen({Key? key, this.isAdmin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/young-student-woman-wearing-denim-jacket-eyeglasses-holding-colorful-folders-showing-thumb-up-pink_176532-13861.jpg?w=996&t=st=1669098409~exp=1669099009~hmac=7d85aa6ae99425f855c100600a03d548e82863042c61f2ab28abcd0b4e93098b',
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'Hi, Boudyy'
                      ),
                      buildSpacerLine2(),
                      Text(
                          'bodynafea2@gmail.com',
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListView.separated(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => isAdmin == true?
                buildSettingItemsList(labels[index],icons[index],screensAdmin[index],context)
                    :
                buildSettingItemsList(labels[index],icons[index],screensUser[index],context),
                separatorBuilder: (context, index) => SizedBox(height: 3,),
                itemCount: labels.length
            ),
          ],
        ),
      ),
    );
  }
  Widget buildSettingItemsList(String label, IconData icon, Widget widget,context)=>Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: InkWell(
          onTap: (){
            if(label != 'helpCenter'.tr)
              navigateTo(context, widget);
            if(label == 'logout'.tr)
              navigateAndFinishSS(context, widget);
          },
          child: Container(
            height: 50,
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                    label,
                ),
              ],
            ),
          ),
        ),
      ),
      buildSpacerLine2(isTop: true,isBottom: true),

    ],
  );
}
