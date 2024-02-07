
import 'package:flutter/material.dart';

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({
    super.key, required this.icon, required this.title, required this.onTap,
  });

  final IconData icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFC2C2C2)),
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 6),
            Text(title,style: const TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

