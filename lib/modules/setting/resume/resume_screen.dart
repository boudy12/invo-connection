import 'package:flutter/material.dart';
import 'package:invoconnection/shared/components/components.dart';

class ResumeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context),
      body:Center(
        child: Text(
          'Resume'
        ),
      ),

    );
  }
}