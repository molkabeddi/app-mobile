import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.appTitle,
    required this.route,
    required this.icon,
    this.actions,
  }) : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(60);

  final String? appTitle;
  final String? route;
  final Icon? icon;
  final List<Widget>? actions;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        widget.appTitle ?? '',
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      actions: widget.actions,
      leading: widget.icon != null
          ? IconButton(
              onPressed: () {
                // If route is given, then this icon button will navigate to that route
                if (widget.route != null) {
                  Navigator.of(context).pushNamed(widget.route!);
                } else {
                  // Else, just simply pop back to the previous page
                  Navigator.of(context).pop();
                }
              },
              icon: widget.icon!,
              iconSize: 16,
              color: Colors.black, // Changed the color to black
            )
          : null,
    );
  }
}
