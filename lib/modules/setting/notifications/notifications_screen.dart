import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoconnection/shared/components/components.dart';

class NotificationsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context,title: 'notification'.tr),
      body: ListView.separated(
          itemBuilder: (context, index) => buildNotificationItem(context),
          separatorBuilder: (context, index) => buildSpacerLine2(),
          itemCount: 10
      ),
    );

  }
}
