import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      onGenerateRoute:(settings) => generateRoute(settings),
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (BuildContext context) {
            return TextButton(onPressed: () {
              Navigator.pushNamed(context, AuthScreen.routeName);
            }, child: const Text('Press Here'),
            );
            },

          ),
        ),
      ),
    );
  }
}
