import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoconnection/shared/cubit/cubit.dart';
import 'package:invoconnection/shared/cubit/states.dart';
import 'package:invoconnection/styles/colors.dart';

class ListenerContainerScreen extends StatelessWidget {

  IconData? icon;
  bool? isPadding = false;
  late String text;


  ListenerContainerScreen({Key? key, this.icon , required this.text,this.isPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Container(
          decoration: BoxDecoration(
              color: cubit.isDark ?  containerDarkMode: containerLightMode,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children:  [
                Icon(
                    icon,
                ),

                const SizedBox(
                  width: 5,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 15
                  ),
                ),

              ],
            ),
          ),
        );
      },

    );
  }
}
