import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:invoconnection/shared/components/components.dart';

class ConnectionAppFavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ConditionalBuilder(
              condition: true,
              builder: (context) => Container(
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildPostItem(context,isFav: true), //cubit.searchModel.data!.data![index],
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    itemCount: 10
                ),
              ),
              fallback: (context) => const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
