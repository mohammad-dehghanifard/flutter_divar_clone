import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProvinceAndCityDialog extends StatelessWidget {
  const EditProvinceAndCityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ExpansionTile(
              onExpansionChanged: (value) {
                if(value){

                }
              },
              shape: const RoundedRectangleBorder(
                  side: BorderSide.none
              ),
              title: const Text("استان"),
              children: List.generate(5, (index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor,width: 1))
                      ),
                      child: Row(
                        children: [
                          Visibility(
                              visible: true,
                              child: Icon(CupertinoIcons.check_mark,color: Theme.of(context).colorScheme.primary)),
                          const SizedBox(width: 8),
                          Text("شهر"),
                        ],
                      )),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
