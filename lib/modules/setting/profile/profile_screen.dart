import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoconnection/modules/chat/chat_details.dart';
import 'package:invoconnection/modules/setting/profile/update/update_profile_screen.dart';
import 'package:invoconnection/shared/components/components.dart';
import 'package:invoconnection/shared/components/constants.dart';

import '../../../shared/cubit/cubit.dart';

class ProfileScreen extends StatelessWidget {
  bool? isProfile = false;
  bool? isOrganizationView = false;
  bool? isPersonView = false;
  List<String> skills = [
    'Databases',
    'Software development life cycle',
    'Teamwork',
    'Leadership',
    'Critical Thinking',
    'Effective communication',
    'Operating Systems',
    'Problem Solving',
    'Problem Solving',
    'Problem Solving',
    'Problem Solving',
    'Problem Solving',
    'Problem Solving',
  ];

  ProfileScreen(
      {Key? key, this.isOrganizationView, this.isPersonView, this.isProfile})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context,
          title: isProfile == true? 'profile'.tr : 'User',
          actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: isProfile == true?  IconButton(onPressed: () {
            navigateTo(context, UpdateProfileScreen());
          }, icon: Icon(Icons.edit_outlined)
          ) : isOrganizationView == true ? TextButton(
              onPressed: () {
                navigateTo(context, ChatDetailsScreen(isAdmin: true,));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.chat,
                      size: 22,
                    ),
                    SizedBox(width: 5,),
                    Text(
                      'chat'.tr,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
          ) : null,
        ),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://img.freepik.com/free-photo/still-life-with-delicious-iced-coffee_52683-91641.jpg?w=996&t=st=1669098311~exp=1669098911~hmac=518fe8859c1a44caea5e0a7e7b3fba2d108dfafda8bb944ca11e6aa708431bff',
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/young-student-woman-wearing-denim-jacket-eyeglasses-holding-colorful-folders-showing-thumb-up-pink_176532-13861.jpg?w=996&t=st=1669098409~exp=1669099009~hmac=7d85aa6ae99425f855c100600a03d548e82863042c61f2ab28abcd0b4e93098b',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        'Alisa',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'bio....',
                        maxLines: 2,
                      ),
                    ],
                  ),
                  Spacer(),
                  if(isOrganizationView == true)
                    TextButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDark1
                                ? Colors.grey[700]
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                                'addEmployee'.tr,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                    ),
                  if(isPersonView == true)
                    TextButton(
                        onPressed: () {
                          navigateTo(context, ChatDetailsScreen(isAdmin: false,));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isDark1
                                  ? Colors.grey[700]
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.chat,
                                  size: 22,
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  'chat'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'Cairo, Egypt',
                ),
              ),
              Text(
                '01127410509',
                style: TextStyle(fontSize: 15),
              ),
              Row(
                children: [
                  Text(
                    'rate'.tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                  ),
                  Container(
                    height: 50,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildRateItems(index, 4.5),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 1,
                            ),
                        itemCount: 5),
                  ),
                ],
              ),
              buildEducationItem(
                context,
                highestEducationLevel: 'Helwan university',
                graduated: '2023',
                fieldOfStudy: 'Computer Science',
                major: 'Mobile App',
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('skills'.tr),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => buildSkillsItems(
                              index + 1, skills[index], context),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 5,
                              ),
                          itemCount: skills.length),
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

  Widget buildRateItems(var index1, var rate) {
    var index = index1 + 1;
    return Icon(
      index <= rate
          ? Icons.star_outlined
          : index > rate && rate > index - 1
              ? Icons.star_half_outlined
              : Icons.star_outline,
    );
  }

  Widget buildSkillsItems(int index, String text, context) => Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: AppCubit.get(context).isDark
                ? Colors.grey[700]
                : Colors.grey[300],
            child: Text(
              '$index',
            ),
          ),
          Text(
            ' $text',
          ),
        ],
      );
}
