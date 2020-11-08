import 'package:flutter/material.dart';

import 'colors_handler.dart';

class BoxDecorationHandler {
  static final BoxDecoration appBar = BoxDecoration(
      color: kThemePrimaryColor,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)));
  static final BoxDecoration servicesItems = BoxDecoration(
      color: kBgServiceItems,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      border: Border.all(width: .5, color: kLineItem));
  static final BoxDecoration servicesItem = BoxDecoration(
      color: kBgServiceItems, border: Border.all(width: .5, color: kLineItem));
  static final BoxDecoration servicesItemTopLeft = BoxDecoration(
      color: kBgServiceItems,
      border: Border.all(width: .5, color: kLineItem),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)));
  static final BoxDecoration servicesItemTopRight = BoxDecoration(
      color: kBgServiceItems,
      border: Border.all(width: .5, color: kLineItem),
      borderRadius: BorderRadius.only(topRight: Radius.circular(8.0)));
  static final BoxDecoration servicesItemBottomLeft = BoxDecoration(
      color: kBgServiceItems,
      border: Border.all(width: .5, color: kLineItem),
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0)));
  static final BoxDecoration servicesItemBottomRight = BoxDecoration(
      color: kBgServiceItems,
      border: Border.all(width: .5, color: kLineItem),
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0)));
  static final BoxDecoration invoiceItemsPage =
      BoxDecoration(color: Colors.white);
}
