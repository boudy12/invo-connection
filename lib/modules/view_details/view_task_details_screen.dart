import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:invoconnection/admin/modules/update_task/update_task_screen.dart';
import 'package:invoconnection/shared/components/components.dart';

class ViewTaskDetailsScreen extends StatelessWidget {
  bool? isAdmin = false;
  ViewTaskDetailsScreen({Key? key, this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(
          context: context,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'organizationName'.tr,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 20),
                  child: Text(
                    'categoryName'.tr,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'tasksDetails'.tr,
                      style: TextStyle(fontSize: 20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'salary'.tr,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          '15,000 \$',
                          style: TextStyle(height: 1.4, fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'time'.tr,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          '2 month',
                          style: TextStyle(height: 1.4, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                buildSpacerLine2(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        'fullTaskDescription'.tr,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Text(
                      'Yet, there is no doubt that its treasures are immense since RELEM offers great possibilities for inter-District co-operation at many different levels. The scope of this possible co-operation is evident in the latest statistics that indicate that the Region is responsible for almost 400 schools, staffed by almost 28,000 teachers, and catering for nearly 300,000 students.'
                      '  In an age of great mobility, particularly for young people, this network offers tremendous opportunities for cultural and educational exchanges for students and teachers alike. However, it is true to say that we have yet to unlock much of this potential.'
                      'Through its various services and Councils – e.g. for the Lasallian educational mission, Assedil (in support of Directors throughout the Region), RELEM Universities and Higher Educational Centres, Young Lasallians – the Region will continue work to harness this potential in support of the Lasallian educational mission.',
                      style: TextStyle(
                        fontSize: 16,
                        wordSpacing: 0.15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                isAdmin! ? Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            defaultButton(
                                text: 'update'.tr,
                                isUpperCase: false,
                                radius: 8,
                                background: HexColor('32468B'),
                                function: () {
                                  navigateTo(context, UpdateTaskScreen());
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(8)),
                              child: MaterialButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.restore_from_trash_outlined,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('delete'.tr),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            defaultButton(
                                text: 'applyNow'.tr,
                                isUpperCase: false,
                                radius: 8,
                                background: HexColor('32468B'),
                                function: () {
                                  print('Apply now');
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[500],
                                  borderRadius: BorderRadius.circular(8)),
                              child: MaterialButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite_border_outlined,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('saveThisTask'.tr),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
