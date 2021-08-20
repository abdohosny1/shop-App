class CategoriesModel{
  dynamic status;
   late CategoriesData data;

  CategoriesModel.fromhson(Map<dynamic,dynamic> json){

    status=json['status'];
    data=json['data'] !=null?CategoriesData.fromjson(json['data']) :null !;

  }

}

class CategoriesData{
  dynamic current_page;

  late List <DataModel>? data;

  CategoriesData.fromjson(Map<dynamic,dynamic>json){
    current_page=json['current_page'];

    if(json['data'] !=null){
      data =<DataModel>[];
      json['data'].forEach((v){
        data!.add(new DataModel.fromjson(v) );
      });
    }

    // if(json['data'] !=null){
    //   data=<DataModel>[];
    //   json['data'].foeEach((e){
    //     data!.add(DataModel.fromjson(e));
    //   });
    // }
  }


}
class DataModel{
 late dynamic id;
  late dynamic name;
  late dynamic image;

  DataModel.fromjson(Map<dynamic,dynamic>json){
    id=json['id'];
    name=json['name'];
    image=json['image'];

  }

}