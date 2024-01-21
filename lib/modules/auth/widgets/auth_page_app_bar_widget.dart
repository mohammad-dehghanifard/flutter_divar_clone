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
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        children: [
          Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
          const Spacer(),
          IconButton(
              onPressed: () => Get.back(),
              iconSize: 24,
              color: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.arrow_forward_outlined))
        ],
      ),
    );
  }
}