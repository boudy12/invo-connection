import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invoconnection/modules/login/login_screen.dart';
import 'package:invoconnection/modules/register/cubit/cubit.dart';
import 'package:invoconnection/modules/register/cubit/states.dart';
import 'package:invoconnection/shared/components/components.dart';
import 'package:invoconnection/shared/components/constants.dart';
import 'package:invoconnection/shared/network/local/cache_helper.dart';
import 'package:invoconnection/styles/colors.dart';
import 'package:invoconnection/styles/icon_broken.dart';

class ConnectionAppRegisterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectionAppRegisterCubit(),

      child: BlocConsumer<ConnectionAppRegisterCubit, ConnectionAppRegisterStates>(
        listener: (context, state) {
            // if (state is ConnectionAppRegisterSuccessState) {
            //   print(state.eCommerceAppUseLoginModel.token);
            //   showToast(
            //       msg:  'registerMessage'.tr,
            //       state: ToastStates.SUCCESS
            //   );
            //   CacheHelper.saveData(
            //     key: 'token',
            //     value: state.eCommerceAppUseLoginModel.token,
            //   ).then((value) {
            //   //  token = CacheHelper.getData(key: 'token');
            //     navigateAndFinishSS(context, ConnectionAppLoginScreen());
            //   });
            // }
            // else if(state is ConnectionAppRegisterErrorState) {
            //   showToast(
            //       msg:  'failed'.tr,
            //       state: ToastStates.ERROR
            //   );
            // }

        },
        builder: (context, state) {
          var cubit = ConnectionAppRegisterCubit.get(context);
          return Scaffold(
            appBar: defaultAppBar(
                context: context,
                title: 'register'.tr
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'registerNow'.tr,
                          style: const TextStyle(
                        fontSize: 26
                    ),
                        ),
                        Text(
                          'registerMessage2'.tr,
                          style: Theme.of(context).textTheme.bodyText2,

                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormFieldWithStyle(
                          context: context,
                            controller: nameController,
                            type: TextInputType.name,
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'nameVerify'.tr;
                              }
                              return null;
                            },
                            onTap: () {},
                            text:  'name'.tr,
                            prefixIcon: Icons.person_outline
                        ),
                        const SizedBox(height: 15,),
                        defaultFormFieldWithStyle(
                            context: context,
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'emailVerify'.tr;
                              }
                              return null;
                            },
                            onTap: () {},
                            text: 'email'.tr,
                            prefixIcon:  Icons.email_outlined
                        ),

                        const SizedBox(height: 15,),
                        defaultFormFieldWithStyle(
                            context: context,
                            controller: phoneController,
                            type: TextInputType.number,
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'phoneVerify'.tr;
                              }
                              return null;
                            },
                            onTap: () {},
                            text: 'phone'.tr,
                            prefixIcon:  Icons.phone
                        ),

                        const SizedBox(height: 15,),
                        defaultFormFieldWithStyle(
                            context: context,
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            isPasswordIcons: cubit.isPasswordRegister,
                            suffix: cubit.suffixRegister,
                            prefixpress: (){
                              cubit.changIconPasswordRegisterState();
                            },
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'passwordVerify'.tr;
                              }
                              return null;
                            },
                            onTap: () {},
                            text: 'password'.tr,
                            prefixIcon: Icons.lock_outlined
                        ),
                        const SizedBox(height: 15,),
                        defaultFormFieldWithStyle(
                            context: context,
                            controller: confirmPasswordController,
                            type: TextInputType.visiblePassword,
                            isPasswordIcons: cubit.isPasswordConfirm,
                            suffix: cubit.suffixConfirm,
                            prefixpress: (){
                              cubit.changIconPasswordConfirmState();
                            },
                            validate: (value){

                                if(passwordController.text != confirmPasswordController.text)
                                  {
                                    return 'checkPassword'.tr ;
                                  }

                              return null;
                            },
                            onTap: () {},
                            text: 'confirmPassword'.tr,
                            prefixIcon: Icons.lock_outlined
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! ConnectionAppRegisterLoadingState,
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
                                text: 'register'.tr,
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
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
