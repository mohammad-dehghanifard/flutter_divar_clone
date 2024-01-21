import 'package:flutter/material.dart';

class SelectProvinceAndCityButton extends StatelessWidget {
  const SelectProvinceAndCityButton({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFECECEC),width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(text,style: const TextStyle(color: Color(0xFF959595))),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down_sharp,color: Color(0xFF959595))
          ],
        ),
      ),
    );
  }
}