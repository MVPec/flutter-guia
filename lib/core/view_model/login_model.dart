
import 'package:flutter/material.dart';
import 'package:winncar/ui/helpers/validator.dart';



class LoginViewModel with ChangeNotifier{


  String  _nameController;

  void setNameController(String name){
 
    _nameController = Validator.validateName(name);
      notifyListeners();
  }
  String get getNameController => _nameController;
  




  // controlar textField email y pasar validacion

  String  _emailController;

  String _valor;

  void setEmailController(String email){
    _valor = email;
    _emailController = Validator.validateEmail(email);
      notifyListeners();
  }
  String get getEmailController => _emailController;
  

  String get getValor => _valor;



  // controlar textField password y pasar validacion

  String  _passwordController;



  void setPasswordController(String password){
    
    _passwordController = Validator.validatePassword(password);
      notifyListeners();
  }
  String get getPasswordController => _passwordController;





  



  
}