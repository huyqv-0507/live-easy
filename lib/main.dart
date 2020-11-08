import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveeasy_huynl/repositories/product_repository.dart';
import 'package:liveeasy_huynl/ui/navigation_ui.dart';
import 'handlers/colors_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LiveEasyApp());
}

class LiveEasyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _LiveEasyAppState createState() => _LiveEasyAppState();
}

class _LiveEasyAppState extends State<LiveEasyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
          backgroundColor: kThemePrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: NavigationUI());
  }
}
