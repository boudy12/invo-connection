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
class UpdateTaskScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  var priceController = TextEditingController();

  var postController = TextEditingController();
  var postFullController = TextEditingController();

  var timeController = TextEditingController();

  final items = ['category'.tr, 'category 1', 'category 2', 'category 3', 'category 4'];

  String selectedValue = 'category'.tr;

  @override

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ConnectionsAppAdminCubit,ConnectionsAppAdminStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        dynamic updateImage = ConnectionsAppAdminCubit.get(context).updateImage;
        dynamic updateImagePic;
        var cubit = ConnectionsAppAdminCubit.get(context);

        if (updateImage == null) {
          updateImagePic = AssetImage(
            'assets/Images/shop3.jpg',
          );
        } else {
          updateImagePic = FileImage(updateImage);
        }
        return Scaffold(
          appBar: defaultAppBar(context: context),
          body: Padding(
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
                        SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: updateImage == null? Container(
                            width: double.infinity,
                            height: 160,
                            decoration: const BoxDecoration(
                                color: Colors.grey
                            ),
                            child: TextButton(
                              onPressed: () {
                                cubit.getUpdateImage();
                              },
                              child: const Text(
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
                                      image: FileImage(updateImage),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        cubit.removeUpdateImage();
                                      },
                                      icon: const CircleAvatar(
                                        backgroundColor:  Colors.redAccent,
                                        radius: 20,
                                        child: Icon(
                                          Icons.remove,

                                          size: 18,
                                        ),
                                      )),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        cubit.getUpdateImage();
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
                                text: 'update'.tr,
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
          ),
        );
      },
    );
  }
}
