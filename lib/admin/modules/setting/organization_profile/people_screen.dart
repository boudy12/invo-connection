import 'package:flutter/material.dart';
import 'package:invoconnection/shared/components/components.dart';

class OrganizationPeopleScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => buildSpacerLine2(),
        itemBuilder: (context, index) => buildUserSearchItem(context, isAdmin: true),
        itemCount: 10);
  }
}
