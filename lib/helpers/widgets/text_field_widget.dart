import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.controller,
    required this.hintText,
    this.icon,
    this.validator,
    this.radius = 12.0,
    this.type = TextInputType.text,
    this.maxLine,
    this.haseBorder = true,
    this.iconColor = const Color(0xFF959595), this.onChange
  });

  final TextEditingController? controller;
  final String hintText;
  final IconData? icon;
  final double radius;
  final TextInputType type;
  final int? maxLine;
  final String? Function(String? value)? validator;
  final bool haseBorder;
  final Color iconColor;
  final Function(String)? onChange;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
   bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.type == TextInputType.visiblePassword ? _obscure : false,
      controller: widget.controller,
      maxLines: widget.type == TextInputType.visiblePassword? 1 :widget.maxLine,
      keyboardType: widget.type,
      validator: widget.validator,
      onChanged: widget.onChange,
      decoration:  InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF959595)),
        contentPadding: const EdgeInsets.all(8),
        suffixIcon: GestureDetector(
          onTap: () {
            if(widget.type == TextInputType.visiblePassword){
              _obscure = !_obscure;
              setState(() {});
            }
          },
          child: Icon(
             widget.type == TextInputType.visiblePassword?  (_obscure?  CupertinoIcons.eye  : CupertinoIcons.eye_slash )
                 : widget.icon,
              color: widget.iconColor),
        ),
        filled: true,
        fillColor: widget.haseBorder? const Color(0xFFFFFFFF) : const Color(0xFFEFEFEF) ,
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