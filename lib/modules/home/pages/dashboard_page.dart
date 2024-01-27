import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/modules/home/pages/home_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: [
            HomePage(),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.orange,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.redAccent,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
