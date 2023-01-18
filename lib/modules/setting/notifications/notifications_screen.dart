import 'package:flutter/material.dart';
import 'package:invoconnection/shared/components/components.dart';

class NotificationsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context),
      body: Center(
        child: Text(
            'All Notifications'
        ),
      ),
    );

  }
}
