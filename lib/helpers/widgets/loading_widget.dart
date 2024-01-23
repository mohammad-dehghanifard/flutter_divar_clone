import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color = Colors.white});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color,
      size: 20,
    );
  }
}
