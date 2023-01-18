import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoconnection/modules/listener_change/container.dart';
import 'package:invoconnection/modules/search_for_user/search_users_screen.dart';
import 'package:invoconnection/shared/components/components.dart';
import 'package:invoconnection/styles/icon_broken.dart';

class AllEmployeesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: true,
      builder: (context) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {

                    navigateTo(context, ConnectionAppSearchUserScreen(isAdmin: true,));
                  },
                  child: ListenerContainerScreen(
                    icon: IconBroken.Search,
                    text: 'search'.tr,
                  ),
                ),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => buildUserSearchItem(context, isAdmin: true),
                itemCount: 10),
          ],
        ),
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );
  }
}
