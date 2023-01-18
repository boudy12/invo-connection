import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoconnection/admin/modules/setting/organization_profile/about_screen.dart';
import 'package:invoconnection/admin/modules/setting/organization_profile/home_screen.dart';
import 'package:invoconnection/admin/modules/setting/organization_profile/people_screen.dart';
import 'package:invoconnection/admin/modules/setting/organization_profile/posts_screen.dart';
import 'package:invoconnection/admin/modules/setting/organization_profile/projects_screen.dart';
import 'package:invoconnection/shared/components/components.dart';
import 'package:invoconnection/styles/colors.dart';

class ConnectionAppOrganizationProfileScreen extends StatefulWidget {
  bool? isAdmin = false;

   ConnectionAppOrganizationProfileScreen({Key? key,this.isAdmin}) : super(key: key);



  @override
  State<ConnectionAppOrganizationProfileScreen> createState() => _ConnectionAppOrganizationProfileScreenState(isAdmin: isAdmin);
}

class _ConnectionAppOrganizationProfileScreenState extends State<ConnectionAppOrganizationProfileScreen> with TickerProviderStateMixin{
  late TabController tabController;

  bool? isAdmin = false;
  _ConnectionAppOrganizationProfileScreenState({this.isAdmin}) ;


  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  } 
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar:
            defaultAppBar(context: context, title: 'profile'.tr, actions: []),
        body: SingleChildScrollView(
            child: Padding (
              padding: const EdgeInsets.all(12.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                              const CircleAvatar(
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
                        const Text(
                          'Alisa',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          'bio....',
                          maxLines: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'Cairo, Egypt',
                          ),
                        ),
                        const Text(
                          '11,000 followers',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        isAdmin == true?  defaultButton(
                          text: 'update'.tr,
                          function: () {},
                          background: defaultColor,
                          radius: 20,
                        ): Row(
                          children: [
                            Expanded(
                              child: defaultButton(
                                text: 'follow'.tr,
                                function: () {},
                                background: defaultColor,
                                radius: 20,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: defaultButton(
                                text: 'learnMore'.tr,
                                function: () {},
                                background: defaultColor,
                                radius: 20,
                                isNonBackgroundColor: true,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ) ,
                        const SizedBox(
                          height: 10,
                        ),
                        buildSpacerLine2(),
                      ],
                    ),
                    Container(
                      child:
                      TabBar(

                          isScrollable: true,
                          controller: tabController,
                          tabs:  [
                            Tab(text: 'home'.tr,),
                            Tab(text: 'about'.tr,),
                            Tab(text: 'posts'.tr,),
                            Tab(text: 'projects'.tr,),
                            Tab(text: 'employees'.tr,),
                          ],
                        ),

                    ),
                    Container(
                      width: double.maxFinite,
                      height:800,
                      child: TabBarView(

                        physics: PageScrollPhysics(),
                        controller: tabController,
                        children:  [
                          OrganizationHomeScreen(),
                          OrganizationAboutScreen(),
                          OrganizationPostsScreen(),
                          OrganizationProjectScreen(),
                          OrganizationPeopleScreen(),
                        ],
                      )
                   ),

                  ]
              ),
            )
        )
    );
  }
}

