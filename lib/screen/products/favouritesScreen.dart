import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/const.dart';
import 'package:shop_app/model/favourit_model.dart';
import 'package:shop_app/cubit/shopCubit/cubit.dart';
import 'package:shop_app/cubit/shopCubit/states.dart';
import 'package:shop_app/style/colors.dart';

class FavouritScreen extends StatelessWidget {
  const FavouritScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        listener : (context,state){},
        builder:  (context,state){
          var cubit =ShopCubit.get(context);
          return ConditionalBuilder(
            condition: state is! ShopLoadingGetFavouritDateState,
            builder: (context)=> ListView.separated(
              physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>bulidListItem(cubit.favouritModel!.data.data![index].product,context),
                separatorBuilder: (context,index)=> mydivider(),
                itemCount: cubit.favouritModel!.data.data!.length),
            fallback: (context)=>Center(child: CircularProgressIndicator(),),
          );
        });
  }


}
