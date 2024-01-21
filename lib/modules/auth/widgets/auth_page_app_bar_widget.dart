import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPageAppBarWidget extends StatelessWidget {
  const AuthPageAppBarWidget({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
      child: Row(
        children: [
          Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
          const Spacer(),

          GestureDetector(
            onTap: () => Get.back(),
              child: Icon(Icons.arrow_forward_outlined,color: Theme.of(context).colorScheme.primary,))
        ],
      ),
    );
  }
}