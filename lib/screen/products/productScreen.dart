import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/const.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/cubit/shopCubit/cubit.dart';
import 'package:shop_app/cubit/shopCubit/states.dart';
import 'package:shop_app/style/colors.dart';

class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){
          if(state is ShopScuessChandeFavouritDateState){
            if(!state.changeFavouritModel.status){
              showTost(masg: state.changeFavouritModel.message, state: ToastState.ERROR);
            }
          }
        },
        builder: (context,staate){
          var cubit=ShopCubit.get(context);
          return ConditionalBuilder(
              condition: cubit.homeModel !=null && cubit.categoriesModel!=null ,
              builder: (context)=>homeBulider(cubit.homeModel!,cubit.categoriesModel!,context),
            fallback: (context)=>Center(child: CircularProgressIndicator(),),
          );
        }
    );
  }

  Widget homeBulider(HomeModel model,CategoriesModel categoriesModel,context){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items: model.data.banners!.map((e) =>
                  Image(
                image: NetworkImage('${e.image}'),
                fit: BoxFit.cover,
                width: double.infinity,
              )).toList(),
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal

              )),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Categories',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
         Container(
                 height: 100,
                 child: ListView.separated(
                   physics: BouncingScrollPhysics(),
                   scrollDirection: Axis.horizontal,
                     itemBuilder: (context,index)=>bulidCategories(categoriesModel.data.data![index]),
                     separatorBuilder: (context,index)=>SizedBox(width: 10,),
                     itemCount: categoriesModel.data.data!.length),
         ),
                SizedBox(height: 20,),
                Text('New Product',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 1.0,
               childAspectRatio: 1/1.72,
             // padding: const EdgeInsets.all(4.0),


              children:List.generate(model.data.products!.length, (index) => productBulider(model.data.products![index],context)
                 ),

            ),
          )

        ],
      ),
    );
  }
Widget bulidCategories (DataModel model)=>Stack(
  alignment: AlignmentDirectional.bottomCenter,
  children: [
    Image(
      image: NetworkImage(model.image),
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    ),
    Container(color: Colors.black.withOpacity(.8),
        width: 100,
        child: Text(
         model.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),))
  ],
);
  Widget productBulider(Products model,context){
    return  Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children:[
              Image(
                image: NetworkImage(model.image),
                width: double.infinity,

                height: 200.0,
              ),
              model.discount !=0 ?  Container(
                color: Colors.red,
                child: Text('DISCOUNT',style: TextStyle(fontSize: 8,color: Colors.white),),
              ) :Text(''),

]
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14,height: 1.3),),
                Row(
                  children: [
                    Text('${model.price.round()} \$',

                    style: TextStyle(fontSize: 12,color: defultColor),),
                    SizedBox(width: 10.0,),
                   model.discount !=0?     Text('${model.old_price.round()} \$', style: TextStyle(fontSize: 10,color: Colors.grey,
                       decoration: TextDecoration.lineThrough,
                     ),) : Text(''),
                    Spacer(),
                    IconButton(
                        onPressed: (){
                          ShopCubit.get(context).changeFavourit(model.id);
                        },
                        icon: CircleAvatar(
                         backgroundColor:(ShopCubit.get(context).favorites![model.id] )! ? defultColor :Colors.grey ,
                        radius :15.0,
                        child: Icon(Icons.favorite_border,color: Colors.white,)
                    )
                    )



                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
}

}
