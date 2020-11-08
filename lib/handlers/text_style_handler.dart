import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';

class TextStyleHandler {
  //logo
  static final TextStyle logoLabel = GoogleFonts.getFont('Handlee',
      fontSize: 40,
      fontWeight: FontWeight.w400,
      color: kLogoTextThemePrimaryColor);
  static final TextStyle subLogoLabel = GoogleFonts.getFont('Handlee',
      fontSize: 12, color: kLogoTextThemePrimaryColor);

  //mobile number
  static final TextStyle confirmPhoneNumber =
      TextStyle(fontWeight: FontWeight.w800, color: kTextThemePrimaryColor);

  //
  static final TextStyle labelInformation =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 30);
  static final TextStyle needAHelpText =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w200);

  //label category
  static final TextStyle labelCategory = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 25, color: kTextLabelCategory);

  //service item in home screen
  static final TextStyle ourServiceItem =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w800);

  //Appbar at home screen
  static final TextStyle infoUserName =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static final TextStyle infoUserLocation = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w200, color: kTextInfoUserLocation);
  static final TextStyle infoBuildingTitle =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 12);
  static final TextStyle infoBuildingbBody =
      TextStyle(fontWeight: FontWeight.w200, fontSize: 10);

  //Hoá đơn
  static final TextStyle invoiceItem =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 15);

  static final TextStyle infoNeedsCookTitle =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 16);
  static final TextStyle infoNeedsCookBody =
      TextStyle(fontWeight: FontWeight.w200, fontSize: 12);

  //Divide

}
