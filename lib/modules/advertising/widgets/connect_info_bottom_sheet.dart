import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:get/get.dart';

class ConnectInfoBottomSheet extends StatelessWidget {
  const ConnectInfoBottomSheet({super.key, required this.mobile, required this.address});
  final String mobile;
  final String address;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Distance.bodyMargin),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.cancel_outlined,color: Theme.of(context).colorScheme.primary)),
          ),
          const Text("شماره موبایل",style: TextStyle(fontSize: 16,color: Color(0xFF959595),fontWeight: FontWeight.w500)),
          Text(mobile,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w700)),

          const Text("آدرس",style: TextStyle(fontSize: 16,color: Color(0xFF959595),fontWeight: FontWeight.w500)),
          Text(address,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
