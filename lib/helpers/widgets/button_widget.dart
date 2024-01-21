import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    required this.onTap,
    required this.text,
    this.width = double.infinity,
    this.height = 43,
    this.radius = 8,
    this.filled = true,
    this.loading = false,
    super.key,
  });

  final Function() onTap;
  final String text;
  final double width;
  final double height;
  final double radius;
  final bool filled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height,
      elevation: filled ? 1 : 0,
      highlightElevation: 0,
      splashColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: filled? BorderSide.none :  BorderSide(color: Theme.of(context).colorScheme.primary)
      ),
      onPressed: loading? (){} : onTap,
      color: filled? Theme.of(context).colorScheme.primary : Colors.transparent,
      child: loading? SpinKitThreeBounce(
        color: Theme.of(context).colorScheme.onPrimary,
        size: 20,
      )
          : Text(text,style: TextStyle(color: filled ? Colors.white : Theme.of(context).colorScheme.primary)),
    );
  }
}