import 'package:flutter/material.dart';
import 'package:invoconnection/shared/components/components.dart';

class OrganizationPostsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => buildPostItem(context, isAdmin: false), //cubit.searchModel.data!.data![index],
        separatorBuilder: (context, index) => SizedBox(height: 10,),
        itemCount: 10
    );
  }
}
