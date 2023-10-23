import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService{

  //Sign up to user service
  void signUpUser ({
    required String name,
    required String email,
    required String password,
    required BuildContext context})async{

    try{
      User user =User(
          name: name, id: '',
          address: '',
          token: '',
          type: '',
          password: '',
          email: ''
      );
      http.Response res= await http.post(
          Uri.parse('$uri/admin/signup'),
          body: user.toJson(),
        headers: <String,String>{
            'Content-Type': 'application/json; charset=UTF-8'
        }

      );
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: (){
            const SnackBar(content: Text('Successfully Account created !!'));
      });
    }
    catch(e){
      SnackBar(content: Text('Error : $e'));
    }
  }

}