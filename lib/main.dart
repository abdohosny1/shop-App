import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/AppCubit.dart';
import 'package:shop_app/cubit/appStates.dart';
import 'package:shop_app/screen/homeScreen.dart';
import 'package:shop_app/screen/login_screen.dart';
import 'package:shop_app/screen/onborderScreen.dart';
import 'package:shop_app/cubit/shopCubit/cubit.dart';
import 'package:shop_app/style/them_style.dart';

import 'cubit/bloc_observe.dart';
import 'model/const.dart';
import 'network/cash_Helper.dart';
import 'network/dio_helper.dart';




void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelpper.init();
  await CashHelper.init();
  late bool OnBoredering=CashHelper.getDate(key: 'OnBoredering');
  //String token=CashHelper.getDate(key: 'token');
   token=CashHelper.getDate(key: 'token');


  print(token);
  Widget widget;
  if(OnBoredering !=null){
    if(token !=null) widget=Home();
    else widget =LoginScreen();
  }else{
    widget=OnBorderingScreen();
  }

  runApp(MyApp(satartWidget:widget));
}

class MyApp extends StatelessWidget {

//  bool OnBoredering;
  final Widget satartWidget;
   MyApp({required this.satartWidget});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>ShopCubit()..getHomeData()..getCategoriesData()..getFavourirData()..getProfileData()),
        BlocProvider(create: (context)=>AppCubit()),

      ],
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            theme:lightThem ,
            darkTheme:darkthem ,
            themeMode:ThemeMode.light,
            //AppCubit.get(context).isDark ?ThemeMode.dark:ThemeMode.light,
            home: Directionality(textDirection: TextDirection.ltr,
                child:satartWidget
              //OnBoredering?LoginScreen()  :OnBorderingScreen()
            ),
            debugShowCheckedModeBanner: false,
          );
        },

      ),

    );
  }
}
