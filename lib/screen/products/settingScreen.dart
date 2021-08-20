import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/const.dart';
import 'package:shop_app/cubit/shopCubit/cubit.dart';
import 'package:shop_app/cubit/shopCubit/states.dart';
import 'package:shop_app/style/colors.dart';

class SettingScreen extends StatelessWidget {

  var nameContoler=TextEditingController();
  var emailaddressContoler=TextEditingController();
  var phoneContoler=TextEditingController();

  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){

        },
        builder: (context,state){
          var cubit=ShopCubit.get(context);
          var model=ShopCubit.get(context).loginModel!.data;
          nameContoler.text=model.name;
          emailaddressContoler.text=model.email;
          phoneContoler.text=model.phone;

          return ConditionalBuilder(
              condition: cubit.loginModel !=null,
              builder: (context)=>Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column
                      (
                      children: [
                        if(state is ShopLoadingUpdateUserDateState)
                        LinearProgressIndicator(),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: nameContoler,
                          keyboardType: TextInputType.name,
                          validator: (e){
                            if(e!.isEmpty){
                              return 'name must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              )
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: emailaddressContoler,
                          keyboardType: TextInputType.emailAddress,
                          validator: (e){
                            if(e!.isEmpty){
                              return 'email must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              )
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: phoneContoler,
                          keyboardType: TextInputType.phone,
                          validator: (e){
                            if(e!.isEmpty){
                              return 'phone must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Phone',
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              )
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            color: defultColor,
                            splashColor: Colors.grey,
                            textColor: Colors.white,
                            onPressed: (){
                             if(formkey.currentState!.validate()){
                               ShopCubit.get(context).updateProfileData(
                                   phone: phoneContoler.text,
                                   name: nameContoler.text,
                                   emaill: emailaddressContoler.text
                               );
                             }
                            },
                            child: Text('UPDATE'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            color: defultColor,
                            splashColor: Colors.grey,
                            textColor: Colors.white,
                            onPressed: (){signOut(context);},
                            child: Text('LOGOUT'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            fallback: (context)=>Center(child: CircularProgressIndicator()),

          );
        });
  }
}
