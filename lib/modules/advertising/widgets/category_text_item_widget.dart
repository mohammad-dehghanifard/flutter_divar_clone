import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/backend/models/category.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';

class CategoryTextItemWidget extends StatelessWidget {
  const CategoryTextItemWidget({
    super.key,
    required this.category,
    this.selected = false, required this.onTap
  });

  final Category category;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal : Distance.bodyMargin,vertical: 8),
          decoration: BoxDecoration(
              border: !selected? Border.all(color: Theme.of(context).colorScheme.primary) : null,
              color: selected? Theme.of(context).colorScheme.primary : null,
              borderRadius: BorderRadius.circular(32)
          ),
          child: Center(
              child: Text(
                category.name!,
                style:  TextStyle(
                    fontSize: 16,
                    color: selected? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),))),
    );
  }
}