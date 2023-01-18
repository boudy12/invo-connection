import 'package:flutter/material.dart';

class OrganizationHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Home'
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                'Home Home Home Home HomeHome  Home Home Home Home Home HomeHomev  HomeHome Home Home Home '
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                'Home Home Home Home HomeHome  Home Home Home Home Home HomeHomev  HomeHome Home Home Home '
            ),
          ],
        ),
      ),
    );
  }
}
