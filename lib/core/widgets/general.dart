import 'package:flutter/material.dart';

Widget pageHeader({ required BuildContext context,required String title,TextAlign textPosition=TextAlign.center}) {
  return Text(
    title,
    style: Theme.of(context).textTheme.headlineMedium,
    textAlign: textPosition,
  );
}

Widget splashHeader({ required BuildContext context, required String title}) {
  return Text(
    title,
    style: Theme.of(context).textTheme.headlineLarge!,
    textAlign: TextAlign.center,
  );
}


