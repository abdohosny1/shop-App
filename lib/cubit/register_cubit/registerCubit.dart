import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/register_cubit/registerStates.dart';
import 'package:shop_app/model/login_model.dart';
import 'package:shop_app/network/dio_helper.dart';
import 'package:shop_app/network/end_ponts.dart';

class RegisterCubit extends Cubit<RegisterState>{

  RegisterCubit() :super(RegisterInitliaState());

  static RegisterCubit get(contxet)=>BlocProvider.of(contxet);
 late LoginModel loginModel;

  void userLogin({required String email,required String password,required String name,required String phone,var image}){
    emit(RegisterLoadingState());

    DioHelpper.postData(
        url: REGISTER,
        data: {
          'email':email,
          'password':password,
          'name':name,
          'phone':phone,
          'image':image,
        }).then((value) {
      loginModel=LoginModel.fromJason(value.data);
      print(loginModel.status);
      print(loginModel.message);
      print(loginModel.data.token);
         // print(value.data);
          emit(RegisterScussState(loginModel));
    }).catchError((e){
      print(e!.toString());
      emit(RegisterErrorState(e!.toString()));
    });

}

IconData sufx=Icons.visibility_outlined;
  bool isPasswordShow=true;
  void cahangePasswordVisibilty(){
    isPasswordShow=!isPasswordShow;
    sufx=isPasswordShow? Icons.visibility_outlined :Icons.visibility_off_outlined;
    emit(RegisterPasswordState());
  }
}