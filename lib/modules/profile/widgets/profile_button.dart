import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    required this.onTap,
    required this.text,
    this.width = double.infinity,
    this.height = 43,
    this.radius = 12,
    this.loading = false,
    super.key, required this.icon,
  });

  final Function() onTap;
  final String text;
  final double width;
  final double height;
  final double radius;
  final bool loading;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height,
      elevation: 1,
      highlightElevation: 0,
      splashColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
      ),
      onPressed: loading? (){} : onTap,
      color: Colors.white,
      child: loading? SpinKitThreeBounce(
        color: Theme.of(context).colorScheme.onPrimary,
        size: 20,
      )
          : Row(
        children: [
          Icon(icon,color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Text(text,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 16)),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_sharp,color: Color(0xFF959595),)
        ],
      ),
    );
  }
}