import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoconnection/modules/setting/profile/update/update_contact_screen.dart';
import 'package:invoconnection/shared/components/components.dart';
import 'package:invoconnection/styles/icon_broken.dart';

class UpdateProfileScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var cityController = TextEditingController();
  var lastNameController = TextEditingController();
  var firstNameController = TextEditingController();
  var headLineController = TextEditingController();
  var countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context,title: 'update'.tr),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 140,
                              width: double.infinity,
                              decoration:  BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://img.freepik.com/free-photo/still-life-with-delicious-iced-coffee_52683-91641.jpg?w=996&t=st=1669098311~exp=1669098911~hmac=518fe8859c1a44caea5e0a7e7b3fba2d108dfafda8bb944ca11e6aa708431bff',
                                    ),
                                    fit: BoxFit.cover,

                                  )
                              ),
                            ),
                            IconButton(

                                onPressed: (){
                             //     SocialAppCubit.get(context).getCoverImage();
                                //  print('asdasd');
                                },
                                icon: const CircleAvatar(
                                  radius: 20,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 18,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/young-student-woman-wearing-denim-jacket-eyeglasses-holding-colorful-folders-showing-thumb-up-pink_176532-13861.jpg?w=996&t=st=1669098409~exp=1669099009~hmac=7d85aa6ae99425f855c100600a03d548e82863042c61f2ab28abcd0b4e93098b',
                            ),
                          ),
                          IconButton(
                              onPressed: (){
                              //  SocialAppCubit.get(context).getProfileImage();
                              },
                              icon:  const CircleAvatar(
                                radius: 30,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 18,
                                ),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                //  personal INFO
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildFiledItem(context, 'firstName', 'name', firstNameController, Icons.person_outline),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),

                      child: buildFiledItem(context, 'lastName', 'name', lastNameController, Icons.person_outline),
                    ),
                    buildFiledItem(context, 'headLine', 'headLineVerify', headLineController, Icons.view_headline),
                    SizedBox(height: 20,),
                  ],
                ),
                //  Location
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'location'.tr,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: buildFiledItem(context, 'country', 'countryVerify', countryController, Icons.my_location_sharp),
                    ),
                    buildFiledItem(context, 'city', 'cityVerify', cityController, Icons.location_city_outlined)
                  ],
                ),
                const SizedBox(height: 15,),
                //  Contact INFO
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'contact'.tr,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black
                      ),
                    ),
                    const Text(
                      'Edit your email.phone and more'
                    ),
                    TextButton(
                        onPressed: (){
                          navigateTo(context, UpdateContactScreen());
                        },
                        child: Text(
                          'Edit Contact info',
                          style: TextStyle(
                            fontSize: 16
                          )
                        )
                    )
                  ],
                ),
                SizedBox(height: 20,),
                defaultButton(
                    text: 'save'.tr,
                    function: (){
                      print(firstNameController.text);
                      print(lastNameController.text);
                      print(headLineController.text);
                      print(countryController.text);
                      print(cityController.text);
                    },
                  radius: 15,

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
