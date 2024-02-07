import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';

class CreateAdsActionButton extends StatelessWidget {
  const CreateAdsActionButton({
    super.key, required this.onTap, required this.child,
  });
  final Function() onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal : Distance.bodyMargin,vertical: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFECECEC)),
              borderRadius: BorderRadius.circular(12)
          ),
          child: child
      ),
    );
  }
}
