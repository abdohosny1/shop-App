 import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/search_cubit/searchStates.dart';
import 'package:shop_app/model/const.dart';
import 'package:shop_app/model/search_model.dart';
import 'package:shop_app/network/dio_helper.dart';
import 'package:shop_app/network/end_ponts.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SerachInitiliteState());
 static  SearchCubit get(context)=>BlocProvider.of(context);

 SearchModel?  searchModel;

 void serach(String text){
   emit(SerachLoadingState());
   DioHelpper.postData(
       url: SEARCH_PRODUCT,
       token: token,
       data: {
         'text':text
       }).then((value) {
         searchModel=SearchModel.fromJson(value.data);
         print(searchModel!.status);
         emit(SerachScussesState());
   }).catchError((e){
     emit(SerachErrorState(e.toString()));
   });
 }
}