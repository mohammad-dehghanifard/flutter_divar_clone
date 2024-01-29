import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/backend/models/city.dart';
import 'package:flutter_divar_clone/backend/models/province.dart';
import 'package:flutter_divar_clone/helpers/widgets/border_button_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FilterCityDialog extends StatelessWidget {
  const FilterCityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.provinces == null
          ? const LoadingWidget()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("انتخاب استان",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                //search
                const TextFieldWidget(
                  hintText: "جستجو در استان ها",
                  icon: Iconsax.search_normal,
                  haseBorder: false,
                ),
                const SizedBox(height: 16),
                // list
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: ListView.builder(
                    itemCount: controller.provinces!.provinceList!.length,
                    itemBuilder: (context, index) {
                      final Province province =
                          controller.provinces!.provinceList![index];
                      return ExpansionTile(
                        onExpansionChanged: (value) {
                          if (value) {}
                        },
                        shape:
                            const RoundedRectangleBorder(side: BorderSide.none),
                        title: Text(province.name ?? ""),
                        children:
                            List.generate(province.cities!.length, (index) {
                          final City city = province.cities![index];
                          return InkWell(
                            onTap: () {},
                            child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color:
                                                Theme.of(context).dividerColor,
                                            width: 1))),
                                child: Row(
                                  children: [
                                    Visibility(
                                        visible: true,
                                        child: Icon(CupertinoIcons.check_mark,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                    const SizedBox(width: 8),
                                    Text(city.name ?? ""),
                                  ],
                                )),
                          );
                        }),
                      );
                    },
                  ),
                ),
                // buttons
                Row(
                  children: [
                    Expanded(
                      child: BorderButtonWidget(
                          onTap: () => Get.back(), text: 'انصراف'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child:
                          ButtonWidget(onTap: () => Get.back(), text: 'تایید'),
                    ),
                  ],
                ),
              ],
            );
    });
  }
}
