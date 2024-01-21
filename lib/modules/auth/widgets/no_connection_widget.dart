import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/modules/auth/controller/splash_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.wifi_exclamationmark,size: 128,color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 4),
        Text("دستگاه شما به اینرنت متصل نمیباشد!",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 16)),
        const SizedBox(height: 32),
        GetBuilder<SplashController>(
            builder: (controller) {
              return ButtonWidget(
                onTap:() =>  controller.checkConnection(),
                loading: controller.loading,
                text: "امتحان مجدد",
              );
            }
        ),
      ],
    );
  }
}