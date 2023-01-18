import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoconnection/modules/search_for_task/cubit/cubit.dart';
import 'package:invoconnection/modules/search_for_task/cubit/states.dart';
import 'package:invoconnection/shared/components/components.dart';

// ignore: must_be_immutable
class ConnectionAppSearchTasksScreen extends StatelessWidget {



  bool isAdmin = false;
  ConnectionAppSearchTasksScreen({Key? key , required this.isAdmin}) : super(key: key);
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectionAppSearchTasksCubit(),
      child: BlocConsumer<ConnectionAppSearchTasksCubit,ConnectionAppSearchTasksStates>(
        listener: (context, state) {},
        builder: (context, state) {
      //    var cubit = ConnectionAppSearchTasksCubit.get(context);
          return Scaffold(
            appBar: defaultAppBar(
                context: context,
                title: 'Search'
            ),
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: defaultFormFieldWithStyle(
                      context: context,
                      controller: searchController,
                      type: TextInputType.text,
                      validate: (value){
                        if(value!.isEmpty)
                        {
                          return 'Search must not be empty';
                        }
                        return null;
                      },
                      text: 'Search',
                      prefixIcon: Icons.search_outlined,
                      onChanged: (value){
                       // cubit.search(text: value);
                      },
                      onSubmit: (text){
                        if(formKey.currentState!.validate())
                        {
                 //       cubit.search(text: text);

                        }
                      },
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if(state is ConnectionAppSearchTasksLoadingStates)
                    const LinearProgressIndicator(),

                //  if(state is ConnectionAppSearchSuccessStates)
                    ConditionalBuilder(
                      condition: true,
                      builder: (context) => Expanded(
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildPostItem(context, isAdmin: isAdmin), //cubit.searchModel.data!.data![index],
                            separatorBuilder: (context, index) => SizedBox(height: 10,),
                            itemCount: 10
                        ),
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator()),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
