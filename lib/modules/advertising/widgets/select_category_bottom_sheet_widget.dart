import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:get/get.dart';

class SelectCategoryBottomSheet extends StatelessWidget {
  const SelectCategoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Distance.bodyMargin),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        )
      ),
      width: double.infinity,
      child: Column(
        children: [
          const Text("انتخاب دسته بندی",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
          // category list
          Expanded(child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Text("item $index");
            },
          ),),
          ButtonWidget(
              width: 160,
              onTap: () => Get.back(),
              text: "تایید")
        ],
      )
    );
  }
}
