import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:invoconnection/admin/modules/setting/organization_profile/organization_profile_screen.dart';
import 'package:invoconnection/admin/modules/update_task/update_task_screen.dart';
import 'package:invoconnection/modules/chat/chat_details.dart';
import 'package:invoconnection/modules/listener_change/container.dart';
import 'package:invoconnection/modules/setting/profile/profile_screen.dart';
import 'package:invoconnection/modules/view_details/view_task_details_screen.dart';
import 'package:invoconnection/shared/components/constants.dart';
import 'package:invoconnection/shared/cubit/cubit.dart';
import 'package:invoconnection/styles/colors.dart';
import 'package:invoconnection/styles/icon_broken.dart';


Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required String text,
  required Function function,
  bool? isNonBackgroundColor = false,
}) =>
    Container(
      width: width,
      height: 40,

      child: MaterialButton(
        onPressed: () => function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: isNonBackgroundColor ==true? defaultColor:Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: isNonBackgroundColor ==true? Border.all(
            color: background,
            width: 2
        ) : null,
        color: isNonBackgroundColor ==true? null :background,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String s)? onChanged,
  Function(String s)? onSubmit,
  bool isPasswordIcons = false,
  required String? Function(String? value) validate,
  required String text,
  Function()? onTap,
  required IconData prefixIcon,
  IconData? suffix,
  Function? prefixpress,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validate,
      onTap: onTap,
      enabled: isClickable,
      obscureText: isPasswordIcons,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () => prefixpress!(),
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
    );

Widget defaultFormFieldWithStyle({
  required TextEditingController controller,
  required TextInputType type,
  Function(String s)? onChanged,
  Function(String s)? onSubmit,
  bool isPasswordIcons = false,
  required String? Function(String? value) validate,
  required String text,
  Function()? onTap,
  IconData? prefixIcon,
  IconData? suffix,
  Function? prefixpress,
  bool isClickable = true,
  context,
  int? maxLines = 1,
  int? minLines = 1,
  bool? isNotPrefixIcon = false,
}) =>
    TextFormField(
      maxLines: maxLines,
      minLines: minLines,
      textDirection: isArabic1? TextDirection.rtl : TextDirection.ltr,
      style: TextStyle(
        color: AppCubit.get(context).isDark ? Colors.white : Colors.blueGrey,

      ),
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validate,
      onTap: onTap,
      enabled: isClickable,
      obscureText: isPasswordIcons,
      cursorColor: defaultColor,
      decoration: InputDecoration(
        focusColor: defaultColor,
        hintText: text,
        hintStyle: TextStyle(
          color: AppCubit.get(context).isDark ? Colors.white : Colors.blueGrey,
        ),
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: defaultColor,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.redAccent,
          ),
        ),


         prefixIcon:  (isNotPrefixIcon == false)  ? Icon(
          prefixIcon,
          color: defaultColor,
        ) : null,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () => prefixpress!(),
                icon: Icon(
                  suffix,
                  color: defaultColor,
                ),
              )
            : null,
      ),
    );

Widget buildSpacerLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey,
      ),
    );

Widget buildSpacerLine2({bool isTop = false,bool isBottom = false,}) => Padding(
  padding: isTop ?  EdgeInsets.only(bottom: 12) : isTop && isBottom?  EdgeInsets.zero: EdgeInsets.symmetric(vertical: 12),
  child: Container(
    color: Colors.grey[300],
    width: double.infinity,
    height: 2,

  ),

);

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinishSS(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

void showToast({
  required String msg,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: chooseToastColor(state),
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
        textColor: Colors.white,
        fontSize: 16,
        gravity: ToastGravity.BOTTOM);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERROR:
      color = Colors.redAccent;
      break;

    case ToastStates.WARNING:
      color = Colors.amberAccent;
      break;
  }
  return color;
}

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String? title = '',
  List<Widget>? actions,
}) =>
    AppBar(
      titleSpacing: 5.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          isArabic1 ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
        ),
      ),
      actions: actions,
      title: Text(
        title!,
      ),
    );



Widget buildPostItem(context ,{bool isFav = false, bool isAdmin = false, bool isConnection = false }) => Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 5,
  margin: const EdgeInsets.symmetric(horizontal: 8),
  child: InkWell(
    onTap: (){
      navigateTo(context, ViewTaskDetailsScreen(isAdmin: isAdmin,));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:  [
              InkWell(
                onTap: (){

                  navigateTo(context, ConnectionAppOrganizationProfileScreen(isAdmin: false,));

                },
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
                      onTap: (){
                        navigateTo(context, ConnectionAppOrganizationProfileScreen(isAdmin: false,));

                      },
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
           Text(
            'Yet, there is no doubt that its treasures are immense since RELEM offers great possibilities for inter-District co-operation at many different levels. The scope of this possible co-operation is evident in the latest statistics that indicate that the Region is responsible for almost 400 schools, staffed by almost 28,000 teachers, and catering for nearly 300,000 students.',
            style: const TextStyle(
              fontSize: 16,
              wordSpacing: 0.15,
              fontWeight: FontWeight.w600,
            ),
             maxLines: isFav ? 2 : 7,
             overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ListenerContainerScreen(
                icon: Icons.price_change_rounded,
                text: '15,000',
              ),
              const Spacer(),

              isAdmin && !isConnection? TextButton(onPressed: () {
                navigateTo(context, UpdateTaskScreen());
              }, child: Text('update'.tr))
                  :
              (isAdmin || !isAdmin) && isConnection? Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('done'.tr , style: TextStyle(color: Colors.white),),
                  ))
              :
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.grey,
                    size: 30,
                  )
              )
              ,

            ],
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
Widget buildEducationItem(context,
    {required String highestEducationLevel,
        required String graduated,
        required String major,
        required String fieldOfStudy}) =>  Padding(
  padding: const EdgeInsets.only(top: 10,bottom: 15),
  child: Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.school,

              ),
              SizedBox(width: 5,),
              Text(
                'educationalBackground'.tr,
              ),
            ],
          ),
          buildSpacerLine2(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'highestEducationLevel'.tr,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                   Text(
                    highestEducationLevel,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'graduated'.tr,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),

                   Text(
                    graduated,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'fieldOfStudy'.tr,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),

                   Text(
                    fieldOfStudy,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'major'.tr,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),

                   Text(
                    major,

                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);

Widget buildUserSearchItem(context,{bool isAdmin = false}) => InkWell(
  onTap: (){
    navigateTo(
        context,
        ProfileScreen(
          isPersonView: isAdmin ? false : true,
          isOrganizationView: isAdmin ?  true : false,
        ));
  },
  child:   Padding(

    padding: const EdgeInsets.all(12.0),

    child: Row(

      children: [

        InkWell(

          onTap: () {

            navigateTo(

                context,

                ProfileScreen(

                  isPersonView: isAdmin ? false : true,

                  isOrganizationView: isAdmin ?  true : false,

                ));

          },

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

            children: [

              const Text(

                'Alisa',

                style: TextStyle(height: 1.4),

              ),

              Text(

                'Yet, there is no doubt that its treasures are immense since RELEM offers great possibilities for inter-District co-operation at many different levels. The scope of this possible co-operation is evident in the latest statistics that indicate that the Region is responsible for almost 400 schools, staffed by almost 28,000 teachers, and catering for nearly 300,000 students.'

                    '  In an age of great mobility',

                style: TextStyle(height: 1.4, fontSize: 12),

                overflow: TextOverflow.ellipsis,

                maxLines: 1,

              ),

            ],

          ),

        ),

        const SizedBox(

          width: 15,

        ),

        InkWell(

          onTap: (){},

          child: Padding(

            padding: const EdgeInsets.all(5.0),

            child: Icon(

              Icons.chat,

            ),

          ),

        ),

      ],

    ),

  ),
);

Widget buildUserChatItem(context,{bool isAdmin = false}) => InkWell(
  onTap: (){
    navigateTo(
        context,
        ChatDetailsScreen(isAdmin: isAdmin,)
    );
  },
  child:   Padding(

    padding: const EdgeInsets.all(12.0),

    child: Row(

      children: [

        const CircleAvatar(

          radius: 25,

          backgroundImage: NetworkImage(

            'https://img.freepik.com/free-photo/young-student-woman-wearing-denim-jacket-eyeglasses-holding-colorful-folders-showing-thumb-up-pink_176532-13861.jpg?w=996&t=st=1669098409~exp=1669099009~hmac=7d85aa6ae99425f855c100600a03d548e82863042c61f2ab28abcd0b4e93098b',

          ),

        ),

        const SizedBox(

          width: 15,

        ),

        Expanded(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(

                'Alisa',

                style: TextStyle(height: 1.4),

              ),

              Text(

                'hello',

                style: TextStyle(height: 1.4, fontSize: 12),

                overflow: TextOverflow.ellipsis,

                maxLines: 1,

              ),

            ],

          ),

        ),

        const SizedBox(

          width: 15,

        ),

        Padding(

          padding: const EdgeInsets.all(5.0),

          child: Text(
            '12:11',
            style: Theme.of(context).textTheme.caption,
          )

        ),

      ],

    ),

  ),
);

Widget buildNotificationItem(context,{bool isAdmin = false}) => InkWell(
  onTap: (){},
  child: Container(
    height: 100,
    decoration: BoxDecoration(
        color: defaultColor.withOpacity(0.2)
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          InkWell(

            onTap: () {


            },

            child: const CircleAvatar(

              radius: 40,

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

              children: [

                const Text(

                  'Alisa',

                  style: TextStyle(height: 1.4),

                ),

                Text(

                  'Yet, there is no doubt that its treasures are immense since RELEM offers great possibilities for inter-District co-operation at many different levels. The scope of this possible co-operation is evident in the latest statistics that indicate that the Region is responsible for almost 400 schools, staffed by almost 28,000 teachers, and catering for nearly 300,000 students.'

                      '  In an age of great mobility',

                  style: TextStyle(height: 1.4, fontSize: 12),

                  overflow: TextOverflow.ellipsis,

                  maxLines: 3,

                ),

              ],

            ),

          ),

          const SizedBox(

            width: 15,

          ),

          InkWell(

            onTap: (){},

            child: const Padding(

                padding: EdgeInsets.all(5.0),

                child: Center(
                  child: CircleAvatar(
                    radius: 5,
                  ),
                )

            ),

          ),

        ],

      ),
    ),
  ),
);


Widget buildFiledItem(context,String fieldName, String fieldVerifyName, TextEditingController controller, IconData icon,{bool? isEmail = false, bool? isPhone = false,})=>Container(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              fieldName.tr
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: defaultFormFieldWithStyle(
                context: context,
                controller: controller,
                type: isEmail==true ?TextInputType.emailAddress: isPhone==true? TextInputType.phone: TextInputType.name,
                validate: (value){
                  if(value!.isEmpty)
                  {
                    return fieldVerifyName.tr;
                  }
                  return null;
                },
                onTap: () {},
                text:  fieldName.tr,
                prefixIcon: icon
            ),
          ),
          const SizedBox(height: 15,),
        ],
      ),
    ],
  ),
);
