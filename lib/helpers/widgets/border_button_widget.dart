import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BorderButtonWidget extends StatelessWidget {
  const BorderButtonWidget({
    required this.onTap,
    required this.text,
    this.width = double.infinity,
    this.height = 43,
    this.radius = 12,
    this.loading = false,
    super.key,
    this.borderColor = const Color(0xFF959595),
    this.textColor = const Color(0xFF959595),
  });

  final Function() onTap;
  final String text;
  final double width;
  final double height;
  final double radius;
  final bool loading;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height,
      elevation: 0,
      highlightElevation: 0,
      splashColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: borderColor)
      ),
      onPressed: loading? (){} : onTap,
      color:  Colors.transparent,
      child: loading? SpinKitThreeBounce(
        color: Theme.of(context).colorScheme.onPrimary,
        size: 20,
      )
          : Text(text,style: TextStyle(color: textColor,fontWeight: FontWeight.w500,fontSize: 16)),
    );
  }
}