class ChangeFavouritModel{
  var status;
  var message;

  ChangeFavouritModel.fromjson(Map<String,dynamic> json){
    status=json['status'];
    message=json['message'];

  }


}