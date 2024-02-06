import 'package:flutter/material.dart';

class DetailActionButton extends StatelessWidget {
  const DetailActionButton({
    super.key, required this.icon, required this.onTap,
  });
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 37,
        height: 37,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white
        ),
        child: Icon(icon,color: const Color(0xFF292D32),),
      ),
    );
  }
}