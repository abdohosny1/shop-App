class LoginModel{
  var status;
  var message;
 late UserData data;

//  LoginModel({this.status, this.message,  this.data});

  LoginModel.fromJason(Map<String,dynamic> json){
    status=json['status'];
    message=json['message'];
    data=json['data'] !=null ? UserData.fromJason(json['data']) :null!;



  }

}

class UserData{
  var id;
  var name;
  var email;
  var phone;
  var image;
  var points;
  var credit;
  var token;

  UserData({this.id, this.name, this.email, this.phone, this.image, this.points,
      this.credit, this.token});

  UserData.fromJason(Map<String,dynamic> json){
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    points=json['points'];
    credit=json['credit'];
    token=json['token'];


  }
}