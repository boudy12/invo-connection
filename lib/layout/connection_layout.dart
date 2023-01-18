import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invoconnection/layout/cubit/cubit.dart';
import 'package:invoconnection/layout/cubit/states.dart';
import 'package:invoconnection/shared/cubit/cubit.dart';

class ConnectionAppLayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectionsAppCubit,ConnectionsAppStates>(
      listener: (context, state) {},
      builder:  (context, state) {
        var cubit = ConnectionsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Connections',
            ),

          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              items:  [
                BottomNavigationBarItem(
                    icon: const Icon(
                        Icons.task_rounded
                    ),
                    label: 'tasks'.tr
                ),
                BottomNavigationBarItem(
                    icon: const Icon(
                        Icons.people_alt_outlined
                    ),
                    label: 'discover'.tr
                ),
                BottomNavigationBarItem(

                    icon:  const Icon(
                        Icons.chat
                    ),
                    label: 'chat'.tr
                ),
                BottomNavigationBarItem(
                    icon: const Icon(
                        Icons.favorite_border_outlined
                    ),
                    label: 'favorites'.tr
                ),
                BottomNavigationBarItem(
                    icon: const Icon(
                        Icons.person
                    ),
                    label: 'account'.tr
                ),
              ],
              elevation: 0,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              }
          ),
        );
      },

    );
  }
}

