import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invoconnection/layout/cubit/cubit.dart';
import 'package:invoconnection/admin/layout/cubit/cubit.dart';
import 'package:invoconnection/admin/layout/cubit/states.dart';

class ConnectionAppAdminLayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectionsAppAdminCubit,ConnectionsAppAdminStates>(
      listener: (context, state) {},
      builder:  (context, state) {
        var cubit = ConnectionsAppAdminCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Connections Admin',
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
                    label: 'employees'.tr
                ),
                BottomNavigationBarItem(
                    icon: const Icon(
                        Icons.add_box_rounded
                    ),
                    label: 'addTask'.tr
                ),

                BottomNavigationBarItem(

                    icon:  const Icon(
                        Icons.chat
                    ),
                    label: 'chat'.tr
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

