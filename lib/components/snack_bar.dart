import 'package:flutter/material.dart';
import 'package:pfa2/models/snack_bar_types.dart';
import 'package:pfa2/utils/config.dart';

class SnackBars {
  final SnackBarsTypes type;
  final String label;
  final VoidCallback onTap;
  final String actionLabel;

  late BuildContext _context;

  SnackBars({
    required this.type,
    required this.label,
    required this.onTap,
    required this.actionLabel,
  });

  void showSnackBar(BuildContext context) {
    _context = context; // Save reference to the context
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(1),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: actionLabel,
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(_context).hideCurrentSnackBar();
          onTap();
        },
      ),
      content: Container(
        height: Config.screenHeight! * 0.03,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Config.screenHeight! * 0.015),
              child: Text(label),
            )
          ],
        ),
      ),
    );
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }
}
