import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/network/cash_Helper.dart';

import 'appStates.dart';



class AppCubit extends Cubit<AppState> {

  AppCubit() :super(AppInitiliState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark=false;

  void changeAppMode([bool? fromshared]) {
    if(fromshared !=null){
      isDark=fromshared;
      emit(AppChangeModeState());

    }else{
      isDark = !isDark;
      CashHelper.putDate(key: 'isDark', value:isDark ).then((value) {

      }
    );

    }

  }


}