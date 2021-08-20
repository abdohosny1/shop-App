
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/network/cash_Helper.dart';
import 'package:shop_app/screen/login_screen.dart';
import 'package:shop_app/screen/products/searchScreen.dart';
import 'package:shop_app/cubit/shopCubit/cubit.dart';
import 'package:shop_app/cubit/shopCubit/states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ShopCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: Text('Salla'),
            actions: [
              IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (t)=>SearchScreen()));
              }, icon: Icon(Icons.search_rounded))
            ],
          ),

         body: cubit.bootom[cubit.curentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.curentIndex,
            onTap: (c){
              cubit.changeBottom(c);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],
          ),
        );
      },

    );
  }
}
