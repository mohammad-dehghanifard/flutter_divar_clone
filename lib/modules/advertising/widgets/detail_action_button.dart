import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/show_snack_bar.dart';

class DetailActionButton extends StatelessWidget {
  const DetailActionButton({
    super.key, required this.icon, required this.onTap,  this.loading = false,
  });
  final IconData icon;
  final Function() onTap;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? () {showSnackBar(message: "لطفا تا پایان اجرای عملیات صبر کنید!", type: SnackBarType.error);} : onTap,
      child: Container(
        width: 37,
        height: 37,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white
        ),
        child: Visibility(
            visible: !loading,
            replacement: LoadingWidget(color: Theme.of(context).colorScheme.primary),
            child: Icon(icon,color: const Color(0xFF292D32),)),
      ),
    );
  }
}