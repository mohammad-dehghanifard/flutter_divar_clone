import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/text_field_widget.dart';
import 'package:iconsax/iconsax.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Distance.bodyMargin),
      child:  Column(
        children: [
          TextFieldWidget(
            onChange: (value) {

            },
            hintText: "آگهی مورد نظر خود را جستجو کنید",
            icon: Iconsax.search_normal,
            iconColor: Theme.of(context).colorScheme.primary,
          )
          // ads list
          // Expanded(
          //     child: ListView.builder(
          //       padding: const EdgeInsets.all(Distance.bodyMargin),
          //       itemCount: controller.adsList!.length,
          //       itemBuilder: (context, index) {
          //         final ads =  controller.adsList![index];
          //         return AdsListItemWidget(ads: ads);
          //       },
          //     )
          // )
        ],
      ),
    );
  }
}
