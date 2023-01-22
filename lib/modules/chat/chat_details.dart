import 'package:flutter/material.dart';
import 'package:invoconnection/modules/setting/profile/profile_screen.dart';
import 'package:invoconnection/shared/components/components.dart';
import 'package:invoconnection/styles/colors.dart';

class ChatDetailsScreen extends StatelessWidget {
  var messageController = TextEditingController();

  bool? isAdmin = false;

  ChatDetailsScreen({Key? key,this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: InkWell(
          onTap: (){
            navigateTo(
                context,
                ProfileScreen(
                  isPersonView: isAdmin==true ? false : true,
                  isOrganizationView: isAdmin==true ?  true : false,
                ));
          },
          child: Row(

            children: [

              const CircleAvatar(

                radius: 20,

                backgroundImage: NetworkImage(

                  'https://img.freepik.com/free-photo/young-student-woman-wearing-denim-jacket-eyeglasses-holding-colorful-folders-showing-thumb-up-pink_176532-13861.jpg?w=996&t=st=1669098409~exp=1669099009~hmac=7d85aa6ae99425f855c100600a03d548e82863042c61f2ab28abcd0b4e93098b',

                ),

              ),

              const SizedBox(

                width: 10,

              ),

              Expanded(

                child:  Text(

                  'Alisa',

                  style: Theme.of(context).textTheme.headline6,

                ),

              ),



            ],

          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            buildMessage(context),
            SizedBox(
              height: 10,
            ),
            buildMyMessage(context),
            Spacer(),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,

                  ),
                  borderRadius: BorderRadius.circular(20),

                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller:messageController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsetsDirectional.all(10),
                          border: InputBorder.none,
                          hintText: 'type here ...',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      color: defaultColor,
                      child: MaterialButton(
                        height: 60,
                        onPressed: (){

                        },
                        minWidth: 1,
                        child: const Icon(
                          Icons.send_outlined,
                          size: 16,
                          color: Colors.white,

                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildMessage(context) =>  Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10
      ),
      decoration:  BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10),
            topStart: Radius.circular(10),
            topEnd: Radius.circular(10),
          )
      ),
      child: Text(
          'Hello World',
          style: Theme.of(context).textTheme.subtitle1
      ),
    ),
  );
  Widget buildMyMessage(context)=> Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10
      ),
      decoration:  BoxDecoration(
          color: defaultColor.withOpacity(0.2),
          borderRadius: const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10),
            topStart: Radius.circular(10),
            topEnd: Radius.circular(10),
          )
      ),
      child: Text(
          'Hello World',
          style: Theme.of(context).textTheme.subtitle1
      ),
    ),
  );
}
