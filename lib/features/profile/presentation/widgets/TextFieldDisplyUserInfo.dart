import 'package:flutter/material.dart';

class TextFieldDisplyUserInfo extends StatelessWidget {
  const TextFieldDisplyUserInfo({
    super.key, required this.userData,
  });
final String userData;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: userData),
      readOnly: true,
      decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 18,
            ),
            enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color:Color(0xFF07A66FF),
    ),
    borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0xFF07A66FF),
      width: 1.3,
    ),
    borderRadius: BorderRadius.circular(16),
            ),
            hintStyle: TextStyle(
    fontSize: 14,
    color: Color(0xFFC2C2C2),
    fontWeight: FontWeight.normal,
            ),
            fillColor: Color(0xFFFDFDFF),
            filled: true,
          ),
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF07A66FF),
          ),);
  }
}