import 'package:flutter/material.dart';
import 'package:invoconnection/shared/components/components.dart';

class AllConnectionsAdminScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildPostItem(context, isAdmin: true,isConnection: true,isFav: true), //cubit.searchModel.data!.data![index],
          separatorBuilder: (context, index) => SizedBox(height: 10,),
          itemCount: 10
      ),
    );
  }
}
