import 'package:flutter/material.dart';

class Appbutton extends StatelessWidget {
 final String title;
 final VoidCallback action;
 const Appbutton({super.key, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: const BoxConstraints(
          minHeight: 50, minWidth: 120),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: action,
          style: Theme.of(context).elevatedButtonTheme.style,
          child: Text(title),
        ),
      ),
    );
  }
}
