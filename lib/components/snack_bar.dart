import 'package:flutter/material.dart';
import 'package:pfa2/models/snack_bar_types.dart';
import 'package:pfa2/utils/config.dart';

class SnackBars {
  final BuildContext context;
  final SnackBarsTypes type;
  final String label;
  final VoidCallback onTap;
  final String actionLabel;

  SnackBars({required this.context, required this.type, required this.label, required this.onTap, required this.actionLabel});

  void showSnackBar() {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(1),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: '${this.actionLabel}',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          onTap();
        },
      ),
      content: Container(
        height: Config.screenHeight! * 0.03,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Config.screenHeight! * 0.015),
              child: Text("${this.label}"),
            )
          ],
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
