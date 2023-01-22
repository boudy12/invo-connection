import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:invoconnection/shared/components/components.dart';
class ConnectionAppAllChatsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: true,
      builder: (context) => SingleChildScrollView(
        child: Column(
          children: [

            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => buildUserChatItem(context,isAdmin: false),
                itemCount: 10),
          ],
        ),
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );
  }
}
