import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key, required this.icon, required this.text, required this.onTap,
  });
  final IconData icon;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: Theme.of(context).colorScheme.primary),
          Text(text,style: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.primary),)
        ],
      ),
    );
  }
}