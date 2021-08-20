import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/shopCubit/cubit.dart';
import 'package:shop_app/cubit/shopCubit/states.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/const.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
       listener : (context,state){},
        builder:  (context,state){
         var cubit =ShopCubit.get(context);
         return ListView.separated(
             itemBuilder: (context,index)=>bulidCardItem(cubit.categoriesModel!.data.data![index]),
             separatorBuilder: (context,index)=> mydivider(),
             itemCount: cubit.categoriesModel!.data.data!.length);
        });
  }

  Widget bulidCardItem(DataModel model){
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage(model.image),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20,),
          Text(model.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Spacer(),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
