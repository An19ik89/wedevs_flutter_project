import 'package:flutter/material.dart';
import 'package:wedevs_flutter_project/app/utils/res/colors.dart';

Widget buildCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 5),
              blurRadius: 6,
            ),
          ],
          gradient: const LinearGradient(
              colors: [CustomColors.KPink, CustomColors.KPinkOrange]),
        ),
        child: child,
      ),
    );
