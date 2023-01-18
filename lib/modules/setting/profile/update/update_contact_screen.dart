import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:invoconnection/shared/components/components.dart';

var formKey = GlobalKey<FormState>();
var emailController = TextEditingController();
var phoneController = TextEditingController();
var addressController = TextEditingController();
var birthdayController = TextEditingController();

class UpdateContactScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context,title: 'Edit Contact info',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildFiledItem(context, 'email', 'emailVerify', emailController, Icons.email_outlined,isEmail: true),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: buildFiledItem(context, 'phone', 'phoneVerify', phoneController, Icons.phone,isPhone: true),
                ),
                buildFiledItem(context, 'address', 'addressVerify', addressController, Icons.house_outlined,),
                SizedBox(height: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'birthday'.tr
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: defaultFormFieldWithStyle(
                              context: context,
                              controller: birthdayController,
                              type:  TextInputType.datetime,
                              validate: (value){
                                if(value!.isEmpty)
                                {
                                  return 'birthdayVerify'.tr;
                                }
                                return null;
                              },
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.parse('1960-01-01'),
                                  lastDate: DateTime.now(),
                                ).then((value) {
                                  birthdayController.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                              text:  'birthday'.tr,
                              prefixIcon: Icons.calendar_today_outlined
                          ),
                        ),
                        SizedBox(height: 20,),
                        defaultButton(
                          text: 'save'.tr,
                          function: (){
                            if(formKey.currentState!.validate()){
                              print(emailController.text);
                              print(phoneController.text);
                              print(addressController.text);
                              print(birthdayController.text);
                            }
                          },
                          radius: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
