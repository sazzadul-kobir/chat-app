import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  String hint;
   CustomFormField({
    required this.hint,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:InputDecoration(
        hintText: hint,
        border: OutlineInputBorder()
      ),
    );
  }
}
