import 'package:flutter/material.dart';


class LoginProvider extends ChangeNotifier{
  String email;
  String password;
  String name;
  String phoneNumber;
  String confirmedPassword;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController phoneNumberController= TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();

  LoginProvider({
    this.email = "",
    this.name = "",
    this.phoneNumber= "",
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
  void enterName(String value) async{
    name = value;
    notifyListeners();
  }
  void enterPhoneNumber(String value) async{
    phoneNumber = value;
    notifyListeners();
  }
  void enterConfirmedPassword(String value) async{
    confirmedPassword = value;
    notifyListeners();
  }

  
}


