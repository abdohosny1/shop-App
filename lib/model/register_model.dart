class RigesterModel{
  var status;
  var message;
 late RegisrerData data;

 RigesterModel.fromjson(Map<String,dynamic>json){
   status=json['status'];
   message=json['message'];
   data=json['data'] !=null ?RegisrerData.fromjson(json['data']) :null !;
 }
}

class RegisrerData{
  var name;
  var phone;
  var email;
  var password;
  var image;

  RegisrerData.fromjson(Map<String,dynamic>json){
    name=json['name'];
    phone=json['phone'];
    email=json['email'];
    password=json['password'];
    image=json['image'];
  }

}