import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';
import 'package:liveeasy_huynl/handlers/padding_handler.dart';

class DividerHandler extends StatelessWidget {
  final String label;
  final Size size;

  DividerHandler({Key key, this.label, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 40,
      decoration: BoxDecoration(color: kBgDividerColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ),
    );
  }
}
