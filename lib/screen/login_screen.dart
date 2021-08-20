import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/cubit/login_cubit/loginCubit.dart';
import 'package:shop_app/cubit/login_cubit/loginStates.dart';
import 'package:shop_app/model/const.dart';
import 'package:shop_app/network/cash_Helper.dart';
import 'package:shop_app/screen/register_screen.dart';

import 'homeScreen.dart';

class LoginScreen extends StatelessWidget {
  var emailConteler=TextEditingController();
  var passConteler=TextEditingController();

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>LoginCubit(),
      child:BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){
          if(state is LoginScussState){
            if(state.loginModel.status){

              CashHelper.saveData(key: 'token', value: state.loginModel.data.token).then((value){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (r)=>Home()),
                        (route) => false);
              });
              //showTost(masg: state.loginModel.message, state: ToastState.SUCESS);


            }else{
              showTost(masg: state.loginModel.message, state: ToastState.ERROR);
            }
          }
        },
        builder: (context,state){
          var cubit=LoginCubit.get(context);
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LOGIN',style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),),
                          Text('Login now to browse our hot offers',style: Theme.of(context).textTheme.bodyText1!.
                          copyWith(color: Colors.grey),),
                          SizedBox(height: 30,),
                          TextFormField(
                            controller: emailConteler,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please Enter Your Email';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Email Address',
                                labelText: 'Email Addres',
                                prefixIcon: Icon(Icons.email_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                )
                            ),
                          ),
                          SizedBox(height: 15,),

                          TextFormField(
                            obscureText: cubit.isPasswordShow,
                            // onChanged: (c){
                            //   if(formKey.currentState!.validate()){
                            //     LoginCubit.get(context).userLogin(email: emailConteler.text, password: passConteler.text);
                            //
                            //   }
                            //
                            // },
                            controller: passConteler,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'password is too short';
                              }
                              return null;
                            },

                            keyboardType: TextInputType.visiblePassword,

                            decoration: InputDecoration(
                                suffixIcon:IconButton(
                                  icon: Icon(cubit.sufx),
                                  onPressed: (){cubit.cahangePasswordVisibilty();},
                                )
                                ,
                                hintText: 'Password ',
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock_clock_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                )
                            ),
                          ),
                          SizedBox(height: 15,),

                       ConditionalBuilder(
                           condition:state is ! LoginLoadingState ,
                           builder: (context)=>   Container(
                             width: MediaQuery.of(context).size.width,
                             height: 50,
                             child: RaisedButton(
                               onPressed: (){
                                 if(formKey.currentState!.validate()){
                                   LoginCubit.get(context).userLogin(
                                       email: emailConteler.text, password: passConteler.text);

                                 }
                               },
                               child: Text('LOGIN'),
                               color: Colors.deepOrange,
                               splashColor: Colors.grey,
                               textColor: Colors.white,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(10))
                               ),
                             ),
                           ),
                         fallback: (context)=>Center(child: CircularProgressIndicator()),
                       ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an acount?'),
                              TextButton(onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (r)=>RegisterScreen()));
                              }, child: Text('REGISTER'))
                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                ),
              ) );
        },

      ) ,
    );
  }
}
