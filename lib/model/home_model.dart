class HomeModel{
  var status;
 late HomeDataModel data;

  HomeModel.fromJson(Map<dynamic,dynamic> json){
    status=json['status'];
    data=json['data'] !=null ? HomeDataModel.fromJason(json['data'])  :null !;

  }

}

class HomeDataModel{
 late List <Banners>? banners;
 late  List <Products>? products;
  //List <Map<String,dynamic>> banners=[];
  // List <Map<String,dynamic>> products=[];


//HomeDataModel({required this.products,required this.banners});

   HomeDataModel.fromJason(Map<String,dynamic> json){

     if(json['banners'] !=null){
       banners =<Banners>[];
       json['banners'].forEach((v){
         banners!.add(new Banners.fromJson(v) );
       });
     }
     if(json['products'] !=null){
       products =<Products>[];
       json['products'].forEach((v){
         products!.add(new Products.fromJson(v) );
       });
     }


    // banners=json['banners'].forEach((element){
    //   banners!.add(element);
    // });

    // json['products'].forEach((e){
    //   products!.add(e);
    // });


  }

}

class Banners{
  dynamic id;
   dynamic image;
 // late Category category;


  Banners.fromJson(Map<dynamic,dynamic> json){
    id=json['id'];
    image=json['image'];

  }
 //
 // Banners.fromJsonn(Map<String,dynamic> json){
 //   id=json['id'];
 //   image=json['image'];
 //   category=json['category'] !=null ? Category.fromJson(json['category']) : null!;
 // }

}
class Category{
  var id;
  var name;
  var image;

  Category.fromJson(Map<String,dynamic> json){
    id=json['id'];
    name=json['name'];
    image=json['image'];

  }
}

class Products{

  dynamic id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  dynamic image;
  dynamic name;
  dynamic in_favorites;
  dynamic in_cart;

  Products.fromJson(Map<dynamic ,dynamic> json){

    id=json['id'];
    price=json['price'];
    old_price=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    in_favorites=json['in_favorites'];
    in_cart=json['in_cart'];
  }

}