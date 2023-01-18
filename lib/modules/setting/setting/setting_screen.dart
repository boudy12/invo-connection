import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invoconnection/modules/dialog/dialog.dart';
import 'package:invoconnection/shared/components/components.dart';
import 'package:invoconnection/shared/cubit/cubit.dart';
import 'package:invoconnection/shared/cubit/states.dart';
import 'package:invoconnection/styles/colors.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: defaultAppBar(
                context: context,
                title: 'setting'.tr,
            ),
            body: Directionality(
              textDirection: AppCubit.get(context).isArabic? TextDirection.rtl : TextDirection.ltr,

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    InkWell(
                      onTap:  (){
                        showDialog(context: context,builder: (builder) =>BlurryDialog('changeLang'.tr));
                      },
                      child: Container(
                        height: 50,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.language_outlined,
                              color:  Colors.blueGrey,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'changeLang'.tr,
                            ),

                          ],
                        ),
                      ),
                    ),
                    buildSpacerLine2(),
                    InkWell(
                      onTap: (){
                        cubit.changeMode();
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.dark_mode_rounded,
                            color:  Colors.blueGrey,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'darkMode'.tr
                          ),
                          Spacer(),
                          Switch(
                              value: cubit.isDark,

                              onChanged: (state){
                                cubit.changeMode();
                              }
                          ),
                        ],
                      ),
                    ),
                  ],

                ),
              ),
            ),
          );
        }

    );
  }
}
