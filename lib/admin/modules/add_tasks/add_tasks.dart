import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invoconnection/admin/layout/cubit/cubit.dart';
import 'package:invoconnection/admin/layout/cubit/states.dart';
import 'package:invoconnection/layout/cubit/states.dart';
import 'package:invoconnection/modules/listener_change/container.dart';
import 'package:invoconnection/modules/view_details/view_task_details_screen.dart';
import 'package:invoconnection/shared/components/components.dart';
import 'package:invoconnection/styles/colors.dart';
import 'package:invoconnection/styles/icon_broken.dart';

import '../../../shared/components/constants.dart';

class AddTasksScreen extends StatefulWidget {

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  var formKey = GlobalKey<FormState>();

  var priceController = TextEditingController();

  var postController = TextEditingController();
  var postFullController = TextEditingController();

  var timeController = TextEditingController();

  final items = ['category'.tr, 'category 1', 'category 2', 'category 3', 'category 4'];

  String selectedValue = 'category'.tr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ConnectionsAppAdminCubit,ConnectionsAppAdminStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        dynamic profileImage = ConnectionsAppAdminCubit.get(context).addImage;
        dynamic profilePic;
        var cubit = ConnectionsAppAdminCubit.get(context);

        if (profileImage == null) {
          profilePic = AssetImage(
            'assets/Images/shop3.jpg',
          );
        } else {
          profilePic = FileImage(profileImage);
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children:  [
                    InkWell(
                      onTap: (){},
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/young-student-woman-wearing-denim-jacket-eyeglasses-holding-colorful-folders-showing-thumb-up-pink_176532-13861.jpg?w=996&t=st=1669098409~exp=1669099009~hmac=7d85aa6ae99425f855c100600a03d548e82863042c61f2ab28abcd0b4e93098b',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          InkWell(
                            onTap: (){},
                            child: const Text(
                              'Alisa',
                              style: TextStyle(
                                  height: 1.4
                              ),
                            ),
                          ),
                          Text(
                            '13 - 3 - 2022',
                            style: TextStyle(
                                height: 1.4,
                                fontSize: 12
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                buildSpacerLine2(),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      defaultFormFieldWithStyle(
                          maxLines: 5,
                          minLines: 1,
                          context: context,
                          controller: postController,
                          type: TextInputType.text,
                          validate: (value){
                            if(value!.isEmpty)
                            {
                              return 'taskDescriptionVerify'.tr;
                            }
                            return null;
                          },
                          onTap: () {},
                          isNotPrefixIcon: true,
                          text:  'taskDescription'.tr,
                          prefixIcon: Icons.person_outline

                      ),
                      const SizedBox(height: 15,),
                      defaultFormFieldWithStyle(
                          maxLines: 11,
                          minLines: 1,
                          context: context,
                          controller: postFullController,
                          type: TextInputType.text,
                          validate: (value){
                            if(value!.isEmpty)
                            {
                              return 'taskFullDescriptionVerify'.tr;
                            }
                            return null;
                          },
                          onTap: () {},
                          isNotPrefixIcon: true,
                          text:  'fullTaskDescription'.tr,
                          prefixIcon: Icons.person_outline

                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          Expanded(
                            child: defaultFormFieldWithStyle(
                                context: context,
                                controller: priceController,
                                type: TextInputType.number,
                                validate: (value){
                                  if(value!.isEmpty)
                                  {
                                    return 'priceVerify'.tr;
                                  }
                                  return null;
                                },
                                onTap: () {},
                                text: 'price'.tr,
                                prefixIcon:  Icons.price_change_rounded
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: defaultFormFieldWithStyle(
                                maxLines: 11,
                                minLines: 1,
                                context: context,
                                controller: postFullController,
                                type: TextInputType.datetime,
                                validate: (value){
                                  if(value!.isEmpty)
                                  {
                                    return 'timeVerify'.tr;
                                  }
                                  return null;
                                },
                                onTap: () {},
                                text:  'time'.tr,
                                prefixIcon: Icons.timer_outlined

                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: defaultColor, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            dropdownColor:
                            isDark1 ? Colors.blueGrey : Colors.white,
                            value: selectedValue,
                            onChanged: (newValue) =>
                                setState(() => selectedValue = newValue!),
                            items: items
                                .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: isDark1
                                            ? Colors.white
                                            : Colors.blueGrey),
                                  ),
                                ))
                                .toList(),

                            // add extra sugar..
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,

                            underline: SizedBox(),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: profileImage == null? Container(
                          width: double.infinity,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.grey
                          ),
                          child: TextButton(
                            onPressed: () {
                              cubit.getAddImage();
                            },
                            child: Text(
                              '+ Add Photo',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                        ): Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: FileImage(profileImage),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      cubit.removeAddedImage();
                                    },
                                    icon: const CircleAvatar(
                                      backgroundColor: Colors.redAccent,
                                      radius: 20,
                                      child: Icon(
                                        Icons.remove,
                                        size: 18,
                                      ),
                                    )),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      cubit.getAddImage();
                                    },
                                    icon: const CircleAvatar(
                                      radius: 20,
                                      child: Icon(
                                        IconBroken.Camera,
                                        size: 18,
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: true,
                        builder: (context) => Center(
                          child: defaultButton(
                              function:(){
                                if(formKey.currentState!.validate())
                                {
                                  // cubit.userRegister(
                                  //   email: emailController.text,
                                  //   password: passwordController.text,
                                  //   confirmPassword:  confirmPasswordController.text,
                                  //   name: nameController.text,
                                  // );
                                }

                              },
                              text: 'addTask'.tr,
                              radius: 10,
                              background: defaultColor,
                              isUpperCase: true,
                              width: 200
                          ),
                        ),
                        fallback: (context) => const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(top: 15.0),
                //   child: Container(
                //     height: 160,
                //     width: double.infinity,
                //     decoration:  BoxDecoration(
                //         borderRadius: BorderRadius.circular(4),
                //         image:  DecorationImage(
                //           image:  NetworkImage(
                //             'https://img.freepik.com/free-photo/still-life-with-delicious-iced-coffee_52683-91641.jpg?w=996&t=st=1669098311~exp=1669098911~hmac=518fe8859c1a44caea5e0a7e7b3fba2d108dfafda8bb944ca11e6aa708431bff',
                //           ),
                //           fit: BoxFit.cover,
                //
                //         )
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
