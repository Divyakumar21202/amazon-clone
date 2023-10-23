import 'package:amazon_clone/common/widget/custom_button.dart';
import 'package:amazon_clone/common/widget/custom_textfield_widget.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth{
  signin,
  signup
}

class AuthScreen extends StatefulWidget {
  static const String routeName='/auth-screen';
   const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _nameController=TextEditingController();
  final AuthService authService=AuthService();
  final _signInFormKey=GlobalKey<FormState>();
  final _signUpFormKey=GlobalKey<FormState>();
  Auth _auth=Auth.signup;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }
  void signUpUser(){
    authService.signUpUser(name: _nameController.text, email: _emailController.text, password: _passwordController.text, context: context);

  }
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                ListTile(
                  tileColor: _auth==Auth.signup?Colors.white:Colors.white60,
                  title: const Text('Sign-Up'),
                  leading: Radio(
                      activeColor: Colors.red,
                      value: Auth.signup,
                      groupValue: _auth,
                      onChanged: (Auth? val){
                      setState(() {
                        _auth=val!;
                      });

                  }
                  ),

                ),

                if(_auth==Auth.signup)
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: Form(
                        key: _signUpFormKey,
                        child:  Column(
                          children: [
                            CustomTextFlied(controller:_nameController,HintText: 'Name',),
                            const SizedBox(height: 10,),
                            CustomTextFlied(controller:_emailController,HintText: 'Email',),
                            const SizedBox(height: 10,),
                            CustomTextFlied(controller:_passwordController,HintText: 'Password',),
                            const SizedBox(height: 10,),
                            CustomButton(text: 'SIGN UP',onTap: (){
                              if(_signUpFormKey.currentState!.validate()){
                                signUpUser();
                              }
                            },
                            ),

                          ],
                        ),
                    ),
                  ),

                ListTile(
                  tileColor: _auth==Auth.signin?Colors.white:Colors.white60,
                  title: const Text('Sign-In'),
                  leading: Radio(
                      activeColor: Colors.red,
                      value: Auth.signin, groupValue: _auth, onChanged: (Auth? val){
                    setState(() {
                      _auth=val!;
                    });
                  }
                  ),
                ),
                if(_auth==Auth.signin)
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: Form(
                      key: _signInFormKey,
                      child:  Column(
                        children: [
                          CustomTextFlied(controller:_emailController,HintText: 'Email',),
                          const SizedBox(height: 10,),
                          CustomTextFlied(controller:_passwordController,HintText: 'Password',),
                          const SizedBox(height: 10,),
                          CustomButton(text: 'SIGN IN',onTap: (){
                            if(_signInFormKey.currentState!.validate()){
                              signUpUser();
                            }
                          },)
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
