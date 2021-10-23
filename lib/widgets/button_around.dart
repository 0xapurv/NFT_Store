import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonRoundWithShadow extends StatelessWidget {
  final Color ? borderColor;
  final Color  ?shadowColor;
  final Color ?color;
  final String? iconPath;
  final VoidCallback? callback;
  final double ?size;

  const ButtonRoundWithShadow(
      {this.borderColor,
        this.shadowColor,
        this.color,
        this.iconPath,
        this.size,
        this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: size == null ? null : size,
        width: size == null ? null : size,
        padding: EdgeInsets.all(size != null ? 8 : 16),
        decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                color: shadowColor!,
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  4.0, // Move to bottom 5 Vertically
                ),
              )
            ],
            color: color,
            shape:
            CircleBorder(side: BorderSide(color: borderColor!, width: 2))),
        child: Icon(Icons.close_sharp,size: 30,),
      ),
    );
  }
}
