import 'package:shop_app/model/login_model.dart';

abstract class LoginState{}
class LoginInitliaState extends LoginState{}

class LoginLoadingState extends LoginState{}
class LoginScussState extends LoginState{
  final LoginModel loginModel;

  LoginScussState(this.loginModel);
}
class LoginErrorState extends LoginState{
  late String error;
  LoginErrorState(this.error);

}

class LoginPasswordState extends LoginState{}
