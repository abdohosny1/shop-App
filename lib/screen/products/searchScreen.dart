import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/search_cubit/searchStates.dart';
import 'package:shop_app/cubit/search_cubit/serchCubit.dart';
import 'package:shop_app/model/const.dart';

class SearchScreen extends StatelessWidget {

  var fromkey=GlobalKey<FormState>();
  var serchConteler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SearchCubit(),
      child:BlocConsumer<SearchCubit,SearchStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(),

            body: Form(
              key: fromkey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller:serchConteler ,
                      validator: (r){
                        if(r!.isEmpty){
                          return 'Search must not be empty';
                        }
                        return null;
                      },
                      onChanged: (text){
                        SearchCubit.get(context).serach(text);
                      },
                      decoration: InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search_rounded),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    if(state is SerachLoadingState)
                    LinearProgressIndicator(),
                    SizedBox(height: 10,),
                    if(state is SerachScussesState)
                    Expanded(child:  ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index)=>bulidListItem(SearchCubit.get(context).searchModel!.data.data![index],context,isoldPrice: false),
                        separatorBuilder: (context,index)=> mydivider(),
                        itemCount:SearchCubit.get(context).searchModel!.data.data!.length
                    ),

                    ) ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
