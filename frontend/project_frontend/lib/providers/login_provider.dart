import 'package:flutter/material.dart';


class LoginProvider extends ChangeNotifier{
  String email;
  String password;
  String confirmedPassword;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();

  LoginProvider({
    this.email = "",
    this.password = "",
    this.confirmedPassword = "",
  });

  void enterEmail(String value) async{
    email = value;
    notifyListeners();
  }

  void enterPassword(String value) async{
    password = value;
    notifyListeners();
  }

  void enterConfirmedPassword(String value) async{
    confirmedPassword = value;
    notifyListeners();
  }

  
}
