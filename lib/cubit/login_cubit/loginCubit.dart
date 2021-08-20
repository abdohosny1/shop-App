import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/appStates.dart';
import 'package:shop_app/model/login_model.dart';
import 'package:shop_app/network/dio_helper.dart';
import 'package:shop_app/network/end_ponts.dart';

import 'loginStates.dart';

class LoginCubit extends Cubit<LoginState>{

  LoginCubit() :super(LoginInitliaState());

  static LoginCubit get(contxet)=>BlocProvider.of(contxet);
 late LoginModel loginModel;

  void userLogin({required String email,required String password}){
    emit(LoginLoadingState());

    DioHelpper.postData(
        url: LOGIN,
        data: {
          'email':email,
          'password':password
        }).then((value) {
      loginModel=LoginModel.fromJason(value.data);
      print(loginModel.status);
      print(loginModel.message);
      print(loginModel.data.token);
         // print(value.data);
          emit(LoginScussState(loginModel));
    }).catchError((e){
      print(e!.toString());
      emit(LoginErrorState(e!.toString()));
    });

}

IconData sufx=Icons.visibility_outlined;
  bool isPasswordShow=true;
  void cahangePasswordVisibilty(){
    isPasswordShow=!isPasswordShow;
    sufx=isPasswordShow? Icons.visibility_outlined :Icons.visibility_off_outlined;
    emit(LoginPasswordState());
  }
}