import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AdsFilterMenuWidget extends StatelessWidget {
  const AdsFilterMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Column(
        children: [
          Icon(Iconsax.sort,color: Theme.of(context).colorScheme.primary),
          Text("جدیدترین ها",style: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.primary),)
        ],
      ),
      position: PopupMenuPosition.under,
      color: Colors.white,
      surfaceTintColor: Colors.transparent,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        itemBuilder: (context) {
         return [
           PopupMenuItem(child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
               decoration: const BoxDecoration(
                   border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE),width: 1))
               ),
               child: const Center(child: Text("جدیدترین ها")))),
           PopupMenuItem(child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
               decoration: const BoxDecoration(
                   border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE),width: 1))
               ),
               child: const Center(child: Text("قدیمی ترین")))),
           PopupMenuItem(child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
               decoration: const BoxDecoration(
                   border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE),width: 1))
               ),
               child: const Center(child: Text("گران ترین")))),
           PopupMenuItem(child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
               child: const Center(child: Text("ارزان ترین")))),
         ] ;
        },
    );
  }
}
