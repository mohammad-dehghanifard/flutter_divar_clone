import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:get/get.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  Dialog(
        insetPadding: const EdgeInsets.all(20),
        shape: const RoundedRectangleBorder(
          borderRadius:  BorderRadius.all(Radius.circular(12))
        ),
       child: Padding(
         padding: const EdgeInsets.all(Distance.bodyMargin),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisSize: MainAxisSize.min,
           children: [
             const Text("آیا از خروج حساب مطمئنید؟",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
             Row(
               children: [
                 // no button
                 Expanded(
                   flex: 2,
                     child: GestureDetector(
                       onTap: () => Get.back(),
                       child: Container(
                         width: double.infinity,
                         height: 36,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12),
                             border: Border.all(color: const Color(0xFF959595))
                         ),
                         child: const Center(child: Text("انصراف",style: TextStyle(color:  Color(0xFF959595),fontWeight: FontWeight.w500),)),
                       ),
                     )
                 ),
                 const SizedBox(width: 8),
                 // yes button
                 Expanded(
                   child: ButtonWidget(
                       onTap: () {},
                       text: "بله"),
                 )
               ],
             )
           ],
         ),
       ),
    );
  }
}
