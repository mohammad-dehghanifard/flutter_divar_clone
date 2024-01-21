import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.controller,
    required this.hintText,
    this.icon,
    this.validator,
    this.radius = 12.0,
    this.type = TextInputType.text,
    this.maxLine = 1
  });

  final TextEditingController? controller;
  final String hintText;
  final IconData? icon;
  final double radius;
  final TextInputType type;
  final int maxLine;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLine,
      keyboardType: type,
      validator: validator,
      decoration:  InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF959595)),
        contentPadding: const EdgeInsets.all(8),
        suffixIcon:  Icon(icon,color: const Color(0xFF959595)),
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFECECEC),width: 1)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFECECEC),width: 1)
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:  BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:  BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)
        ),
      ),
    );
  }
}