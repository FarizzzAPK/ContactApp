import 'package:flutter/material.dart';

typedef CustomInputFieldCallback = String? Function(String value);

class CustomInputField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  TextInputType textInputType;
  CustomInputFieldCallback validator;

  CustomInputField(
      {required this.hintText,
      required this.controller,
      required this.validator,
  required this.textInputType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      style: TextStyle(
        color: Color(0xffFFF1D4),
      ),
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validator(value!),
      decoration: InputDecoration(

        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xffFFF1D4),

        ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xffFFF1D4))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xffFFF1D4))),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xffFFF1D4))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xffFFF1D4))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red))),
    );
  }
}
