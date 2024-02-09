import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/backend/models/city.dart';
import 'package:flutter_divar_clone/backend/models/province.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/modules/profile/controller/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditProvinceAndCityDialog extends StatelessWidget {
  const EditProvinceAndCityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.all(16),
      child: GetBuilder<EditProfileController>(
        builder: (controller) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.8,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.provinceResponse!.provinceList!.length,
                    itemBuilder: (context, index) {
                      final Province province = controller.provinceResponse!.provinceList![index];
                      return ExpansionTile(
                        onExpansionChanged: (value) {
                          if(value){
                            controller.changeProvince(province);
                          }
                        },
                        shape: const RoundedRectangleBorder(
                            side: BorderSide.none
                        ),
                        title:  Text(province.name!),
                        children: List.generate(province.cities!.length, (index) {
                          final City city = province.cities![index];
                          return InkWell(
                            onTap: () => controller.changeCity(city),
                            child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor,width: 1))
                                ),
                                child: Row(
                                  children: [
                                    Visibility(
                                        visible: city.id! == controller.selectedCity?.id!,
                                        child: Icon(CupertinoIcons.check_mark,color: Theme.of(context).colorScheme.primary)),
                                    const SizedBox(width: 8),
                                    Text(city.name!),
                                  ],
                                )),
                          );
                        }),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ButtonWidget(onTap: () => Get.back(), text: "تایید"),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
