import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/shopCubit/states.dart';
import 'package:shop_app/model/add_favourit.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/const.dart';
import 'package:shop_app/model/favourit_model.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/model/login_model.dart';
import 'package:shop_app/network/dio_helper.dart';
import 'package:shop_app/network/end_ponts.dart';
import 'package:shop_app/screen/products/categoriesScreen.dart';
import 'package:shop_app/screen/products/favouritesScreen.dart';
import 'package:shop_app/screen/products/productScreen.dart';
import 'package:shop_app/screen/products/settingScreen.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit():super(ShopInitiliteState());
 static ShopCubit get(context) =>BlocProvider.of(context);
  int curentIndex=0;

  List<Widget> bootom=[
    ProductScreen(),
    CategoriesScreen(),
    FavouritScreen(),
    SettingScreen()
  ];

  void changeBottom(int index){
    curentIndex=index;
    emit(ShopChangeBootomNaveState());

  }

  HomeModel? homeModel;
    Map<int,bool>? favorites={};

  void getHomeData(){
    emit(ShopLoadingHomeDateState());
  DioHelpper.getData(
      url: HOME,
    token: token
  ).then((value) {
    homeModel=HomeModel.fromJson(value.data);

    // print(homeModel.toString());
    // print(homeModel!.status);
    homeModel!.data.products!.forEach((element) {
      favorites!.addAll({
        element.id:element.in_favorites,
      });
     // print(favorites!.toString());
      emit(ShopScuessHomeDateState());
    });
    //print(homeModel!.data.banners[0]);

  }).catchError((e){
    print('error is : ${e.toString()}');
    emit(ShopErrorHomeDateState(e.toString()));

  })  ;
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData(){

    DioHelpper.getData(
        url: GET_CATEGORIES,

    ).then((value) {
      categoriesModel=CategoriesModel.fromhson(value.data);
      emit(ShopScuessCategoriesDateState());
      // print(categoriesModel.toString());
      // print(categoriesModel!.status);
      //print(homeModel!.data.banners[0]);

    }).catchError((e){
      print('error is : ${e.toString()}');
      emit(ShopErrorCategoriesDateState(e.toString()));

    })  ;
  }

  ChangeFavouritModel ? changeFavouritModel;

  void changeFavourit(int productID){

    favorites![productID] =! (favorites![productID])!;
    emit(ShopChandeFavouritDateState());
    DioHelpper.postData(
        url: GET_FAVOURIT,
        data: {
          'product_id':productID
        },
       token: token
    )
        .then((value) {
          changeFavouritModel=ChangeFavouritModel.fromjson(value.data);
         // print(value.data);
          if(!changeFavouritModel!.status){
            favorites![productID] =! (favorites![productID])!;
          }else{
            getFavourirData();
          }

       emit(ShopScuessChandeFavouritDateState(changeFavouritModel!));
    }).catchError((e){
      favorites![productID] =! (favorites![productID])!;
      emit(ShopErrorChandeFavouritDateState(e.toString()));
    });
  }


  FavouritModel? favouritModel;

  void getFavourirData(){

    emit(ShopLoadingGetFavouritDateState());
    DioHelpper.getData(
      url: GET_FAVOURIT,
      token: token,

    ).then((value) {
      favouritModel=FavouritModel.fromJson(value.data);

      // print(favouritModel.toString());
      // print(favouritModel!.status);
      //print(homeModel!.data.banners[0]);
      emit(ShopScuessGetFavouritDateState());

    }).catchError((e){
      print('error is : ${e.toString()}');
      emit(ShopErrorGetFavouritDateState(e.toString()));

    })  ;
  }



  LoginModel? loginModel;

  void getProfileData(){

    emit(ShopLoadingGetProfileDateState());
    DioHelpper.getData(
      url: GET_PROFILE,
      token: token,

    ).then((value) {
      loginModel=LoginModel.fromJason(value.data);
      token=loginModel!.data.token;

      print(loginModel.toString());
      print(loginModel!.data.name);
      //print(homeModel!.data.banners[0]);
      emit(ShopScuessGetProfileDateState(loginModel!));

    }).catchError((e){
      print('error is : ${e.toString()}');
      emit(ShopErrorGetProfileDateState(e.toString()));

    })  ;
  }

  void updateProfileData({required String name,required String phone,required String emaill}){

    emit(ShopLoadingUpdateUserDateState());
    DioHelpper.PutData(
      url: UPDATE,
      token: token,
      data: {
        'name':name,
        'phone':phone,
        'email':emaill,
      },

    ).then((value) {
      loginModel=LoginModel.fromJason(value.data);
      token=loginModel!.data.token;

      print(loginModel.toString());
      print(loginModel!.data.name);
      //print(homeModel!.data.banners[0]);
      emit(ShopScuessUpdateUserDateState(loginModel!));

    }).catchError((e){
      print('error is : ${e.toString()}');
      emit(ShopErrorUpdateUserState(e.toString()));

    })  ;
  }
}