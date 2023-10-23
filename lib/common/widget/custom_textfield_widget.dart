import 'package:flutter/material.dart';
class CustomTextFlied extends StatelessWidget {
  const CustomTextFlied({super.key, required this.controller, required this.HintText});
  final TextEditingController controller;
  final String HintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      decoration:  InputDecoration(
        hintText: HintText ,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54
          )
        ),
        enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black54
                )
        ),
      ),
      validator: (val){
        if(val==null || val.isEmpty){
          return 'Enter Your $HintText';
        }
        return null;

      },
    );
  }
}
