import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName :
      return MaterialPageRoute(builder: (_)=>AuthScreen(),
      settings: routeSettings);

    default :
      return MaterialPageRoute(builder: (_)=>const Scaffold(
        body: Center(child: Text('Page Does not Exist'),
        ),
      ),
      settings: routeSettings);



  }
}