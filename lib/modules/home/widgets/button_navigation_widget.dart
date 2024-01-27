import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/modules/home/controller/dashboard_controller.dart';
import 'package:iconsax/iconsax.dart';

class ButtonNavigationWidget extends StatelessWidget {
  const ButtonNavigationWidget({
    super.key, required this.controller,
  });
  final DashboardController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.sizeOf(context).width,
          height: 65,
          padding: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  blurRadius: 6,offset: const Offset(0,-3)
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                // add new ads button
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            blurRadius: 6,offset: const Offset(0,3)
                        )
                      ],
                    ),
                    child: const Icon(Iconsax.add_square,color: Colors.white),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      controller.navList.length,
                          (index) => Padding(
                            padding:  EdgeInsets.only(left: index == 1? 40 : 0,right: index == 2? 40 : 0),
                            child: GestureDetector(
                              onTap: () => controller.onChangePage(index),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                      controller.navList[index].icon,
                                      color: controller.currentPage == index? Theme.of(context).colorScheme.primary : const Color(0xFF959595),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(controller.navList[index].label,style: TextStyle(color :controller.currentPage == index? Theme.of(context).colorScheme.primary : const Color(0xFF959595)))
                                ],
                              ),
                            ),
                          )
                  ) ,
                ),


              ],
            ),
          ),
        );


  }
}


class NavItem {
  const NavItem({required this.icon,required this.label,this.selected = false});
  final IconData icon;
  final String label;
  final bool selected;
}