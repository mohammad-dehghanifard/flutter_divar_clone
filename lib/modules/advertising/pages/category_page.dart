import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/backend/models/category.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/modules/advertising/controller/category_controller.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/category_item_widget.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (controller) {
        return controller.categoryResponse == null
            ? LoadingWidget(
                color: Theme.of(context).colorScheme.primary,
              )
            : ListView.builder(
                padding: const EdgeInsets.all(Distance.bodyMargin),
                itemCount: controller.categoryResponse!.data!.length,
                itemBuilder: (context, index) {
                  final Category category = controller.categoryResponse!.data![index];
                  return CategoryItemWidget(category: category);
                },
              );
      },
    );
  }
}


