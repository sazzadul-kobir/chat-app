import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hint;
  final RegExp validationRegExp;
  final bool obescureText;
  final void Function(String?) onSaved;
  
   CustomFormField({
    required this.hint,
     required this.validationRegExp,
     this.obescureText=false,
     required this.onSaved
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      obscureText: obescureText,
      validator: (value){
        if(value !=null && validationRegExp.hasMatch(value)){
          return null;
        }
        return "Enter a valid ${hint.toLowerCase()}";
      },
      decoration:InputDecoration(
        hintText: hint,
        border: OutlineInputBorder()
      ),
    );
  }
}
