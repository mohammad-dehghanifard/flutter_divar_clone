import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // app name and loading
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // app name
                  Text("اپلیکیشن آگهی هیتال", style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 26, color: Theme
                      .of(context)
                      .colorScheme
                      .primary)),
                  const SizedBox(height: 12),
                  // loading
                  SpinKitThreeBounce(
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                ],
              ),
              // version
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("ورژن : 1.0.0",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)))
            ],
          ),
        ),
      ),
    );
  }
}
