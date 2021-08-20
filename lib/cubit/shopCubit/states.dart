import 'package:shop_app/model/add_favourit.dart';
import 'package:shop_app/model/login_model.dart';

abstract class ShopStates{}
class ShopInitiliteState extends ShopStates{}
class ShopChangeBootomNaveState extends ShopStates{}


class ShopLoadingHomeDateState extends ShopStates{}
class ShopScuessHomeDateState extends ShopStates{}
class ShopErrorHomeDateState extends ShopStates{
 late String error;
 ShopErrorHomeDateState(this.error);
}



class ShopLoadingCategoriesDateState extends ShopStates{}
class ShopScuessCategoriesDateState extends ShopStates{}
class ShopErrorCategoriesDateState extends ShopStates{
 late String error;
 ShopErrorCategoriesDateState(this.error);
}

class ShopScuessChandeFavouritDateState extends ShopStates{
 final ChangeFavouritModel changeFavouritModel;

  ShopScuessChandeFavouritDateState(this.changeFavouritModel);
}
class ShopChandeFavouritDateState extends ShopStates{}
class ShopErrorChandeFavouritDateState extends ShopStates{
 late String error;
 ShopErrorChandeFavouritDateState(this.error);
}

class ShopLoadingGetFavouritDateState extends ShopStates{}
class ShopScuessGetFavouritDateState extends ShopStates{}
class ShopErrorGetFavouritDateState extends ShopStates{
 late String error;
 ShopErrorGetFavouritDateState(this.error);
}


class ShopLoadingGetProfileDateState extends ShopStates{}
class ShopScuessGetProfileDateState extends ShopStates{
 late LoginModel loginModel;
 ShopScuessGetProfileDateState(this.loginModel);
}
class ShopErrorGetProfileDateState extends ShopStates{
 late String error;
 ShopErrorGetProfileDateState(this.error);
}



class ShopLoadingRegistertDateState extends ShopStates{}
class ShopScuessRegistertDateState extends ShopStates{}
class ShopErrorRegistertDateState extends ShopStates{
 late String error;
 ShopErrorRegistertDateState(this.error);
}



class ShopLoadingUpdateUserDateState extends ShopStates{}
class ShopScuessUpdateUserDateState extends ShopStates{
 final LoginModel loginModel;

  ShopScuessUpdateUserDateState(this.loginModel);
}
class ShopErrorUpdateUserState extends ShopStates{
 late String error;
 ShopErrorUpdateUserState(this.error);
}
