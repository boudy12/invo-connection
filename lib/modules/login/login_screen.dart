import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invoconnection/modules/login/cubit/cubit.dart';
import 'package:invoconnection/modules/login/cubit/states.dart';
import 'package:invoconnection/modules/register/rigester_screen.dart';
import 'package:invoconnection/shared/components/components.dart';
import 'package:invoconnection/shared/components/constants.dart';
import 'package:invoconnection/shared/network/local/cache_helper.dart';
import 'package:invoconnection/styles/colors.dart';

class ConnectionAppLoginScreen extends StatelessWidget  {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  ConnectionAppLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectionAppLoginCubit(),
      
      child: BlocConsumer<ConnectionAppLoginCubit, ConnectionAppLoginStates>(
        listener: (context, state) {
          // if(state is ConnectionAppLoginSuccessState) {
          //   if (state.eCommerceAppUseLoginModel.token != null) {
          //     print(state.eCommerceAppUseLoginModel.token);
          //     showToast(
          //         msg:  'welcome'.tr,
          //         state: ToastStates.SUCCESS
          //     );
          //     CacheHelper.saveData(
          //         key: 'token',
          //         value: state.eCommerceAppUseLoginModel.token,
          //
          //     ).then((value) {
          //       token=CacheHelper.getData(key: 'token');
          //       navigateAndFinishSS(context, ConnectionLayoutScreen());
          //
          //     });
          //
          //     CacheHelper.saveData(
          //       key: 'userId',
          //       value: state.eCommerceAppUseLoginModel.data!.id,
          //
          //     ).then((value) {
          //       userId=CacheHelper.getData(key: 'userId');
          //
          //     });
          //   }
          //   else {
          //     showToast(
          //       msg:  'failed'.tr,
          //       state: ToastStates.ERROR
          //     );
          //   }
          // }
        },
        builder: (context, state) {
          var cubit = ConnectionAppLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
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
                          'login'.tr,
                          style: const TextStyle(
                            fontSize: 26
                          ),
                        ),
                        Text(
                          'loginMessage'.tr,
                          style: Theme.of(context).textTheme.bodyText2,

                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormFieldWithStyle(
                            context: context,
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            onTap: () {},
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'emailVerify'.tr;
                              }
                              return null;
                            },

                            text: 'email'.tr,
                            prefixIcon: Icons.email_outlined
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormFieldWithStyle(
                            context: context,
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            suffix: cubit.isPasswordLogin ? Icons.remove_red_eye : Icons.visibility_off_outlined,
                            isPasswordIcons: cubit.isPasswordLogin,
                            prefixpress: (){
                              cubit.changIconPasswordLoginState();
                            },
                            onTap: () {},
                            onSubmit: (value){
                              if(formKey.currentState!.validate())
                              {
                                // cubit.userLogin(
                                //   email: emailController.text,
                                //   password: passwordController.text,
                                // );
                              }
                            },
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'passwordVerify'.tr;
                              }
                              return null;
                            },

                            text: 'password'.tr,
                            prefixIcon: Icons.lock_outline
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! ConnectionAppLoginLoadingState,
                          builder: (context) => Center(
                            child: defaultButton(
                                function:(){
                                  if(formKey.currentState!.validate())
                                    {
                                      // cubit.userLogin(
                                      //     email: emailController.text,
                                      //     password: passwordController.text,
                                      // );
                                    }
                                },
                                text: 'login'.tr,
                                radius: 10,
                                background: defaultColor,
                                isUpperCase: true,
                                width: 200
                            ),
                          ),
                          fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              'messageRegister'.tr,
                            ),
                            TextButton(
                              onPressed: (){
                                navigateTo(context, ConnectionAppRegisterScreen());
                              },
                              child:  Text(
                                'registerNow'.tr,
                                style: const TextStyle(
                                  color: defaultColor
                                ),
                              ),
                            ),
                          ],
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
