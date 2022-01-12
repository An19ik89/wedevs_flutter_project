import 'package:flutter/material.dart';

class CurveBackGround extends StatelessWidget {
  final Widget child;
  final double? margins;
  final double? paddings;
  final Color? colors;
  final double? radius;
  final bool? shadow;
  final double? height;
  final double? width;
  final double? blurRadious;
  final double? spreadReaious;

  const CurveBackGround({Key? key, required this.child, this.margins, this.paddings, this.colors, this.radius, this.shadow, this.height, this.width, this.blurRadious, thisreadReaious, this.spreadReaious})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?? null,
      width: width ?? null,
      margin: EdgeInsets.all( margins ?? 10),
      padding: EdgeInsets.all( paddings ?? 10),
      child: child,
      decoration: BoxDecoration(
        color: colors ?? Colors.white,
        borderRadius: BorderRadius.circular(radius ?? 20),
        boxShadow: shadow == false ? null :[
          BoxShadow(
            spreadRadius: spreadReaious ?? 0,
            color: Colors.grey.withOpacity(0.3),
            blurRadius: blurRadious ?? 3,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
    );


  }
}