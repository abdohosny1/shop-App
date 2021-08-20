import 'package:shop_app/model/login_model.dart';

abstract class RegisterState{}
class RegisterInitliaState extends RegisterState{}

class RegisterLoadingState extends RegisterState{}
class RegisterScussState extends RegisterState{
  final LoginModel loginModel;

  RegisterScussState(this.loginModel);
}
class RegisterErrorState extends RegisterState{
  late String error;
  RegisterErrorState(this.error);

}

class RegisterPasswordState extends RegisterState{}
