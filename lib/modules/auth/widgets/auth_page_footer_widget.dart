import 'package:flutter/material.dart';

class AuthFooterWidget extends StatelessWidget {
  const AuthFooterWidget({
    super.key, required this.text, required this.buttonText, required this.onTap,
  });
  final String text;
  final String buttonText;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: const TextStyle(fontWeight: FontWeight.w700,color: Color(0xFF8C8C8C),fontSize: 17)),
        const SizedBox(width: 4),
        GestureDetector(
            onTap: onTap,
            child: Text(buttonText,style: TextStyle(fontWeight: FontWeight.w700,color: Theme.of(context).colorScheme.primary,fontSize: 17))),
      ],
    );
  }
}