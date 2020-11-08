import 'dart:ui';

extension ColorsHandler on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

/*
1. Theme
2. Social button
3. BottomNavigationBar
4. Service of items in HomeScreen
5. SearchBox
6. Divider
7. BoxShadow
8. FLoat button
9. Appbar at Home screen
10. Invoice page
11. Cook page
12. Back button
 */

//1. Color theme
final kThemePrimaryColor = ColorsHandler.fromHex('#5EBBA0');
final kTextThemePrimaryColor = ColorsHandler.fromHex('#000000');
final kLogoTextThemePrimaryColor = ColorsHandler.fromHex('#FFFFFF');
final kBgLogoThemePrimaryColor = ColorsHandler.fromHex('#FFFFFF');

//2. Social button
final kSignUpMobileNumberColor = ColorsHandler.fromHex('#5EBBA0');
final kGoogleColor = ColorsHandler.fromHex('#ffffff');
final kFacebookColor = ColorsHandler.fromHex('#ffffff');
final kTwitterColor = ColorsHandler.fromHex('#1DA1F2');

//Color bg button social
final kBgSignUpMobileNumberColor = ColorsHandler.fromHex('#FFFFFF');
final kBgGoogleColor = ColorsHandler.fromHex('#DB4437');
final kBgFacebookColor = ColorsHandler.fromHex('#4267B2');

//3. BottomNavigationBar
final kSelectedNavItemColor = ColorsHandler.fromHex('#5EBBA0');
final kUnSelectedNavItemColor = ColorsHandler.fromHex('#AAAAAA');

//4. ServicesItems HomeScreen
final kBgServiceItems = ColorsHandler.fromHex("#FFFFFF");
final kBgAppBar = ColorsHandler.fromHex('#EBEBEB');
final kLineItem = ColorsHandler.fromHex('#DBDBDB');

//5. SearchBox
final kPlaceholderSearchColor = ColorsHandler.fromHex('#D7D6D9');
final kBgSearchColor = ColorsHandler.fromHex('#FFFFFF');

//6. Divider
final kBgDividerColor = ColorsHandler.fromHex('#E6EAEA');
final kLabelDividerColor = ColorsHandler.fromHex('#4F4E4E');

//7. BoxShadow
final kBoxShadowColor = ColorsHandler.fromHex('#797979');

//8. FLoat button
final kFloatButton = ColorsHandler.fromHex('#FFFFFF');

//9. Appbar at Home screen
final kTextInfoUserLocation = ColorsHandler.fromHex('#474948');
final kTextLabelCategory = ColorsHandler.fromHex('#5FA77F');
final kActionAppBarIcon = ColorsHandler.fromHex('#FFFFFF');

//10. Invoice page
final kBgInvoicePage = ColorsHandler.fromHex('#EDF1F0');

//11. Cook page
final kSelectedTabbar = ColorsHandler.fromHex('#FFFFFF');
final kUnSelectedTabbar = ColorsHandler.fromHex('#ABABAB');
