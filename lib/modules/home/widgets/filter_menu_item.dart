import 'package:flutter/material.dart';

class FilterMenuItem extends StatelessWidget {
  const FilterMenuItem({
    super.key, required this.title,  this.showBorder = true,
  });
  final String title;
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration:  BoxDecoration(
            border: showBorder? const Border(bottom: BorderSide(color: Color(0xFFDEDEDE),width: 1)) : null
        ),
        child:  Center(child: Text(title)));
  }
}