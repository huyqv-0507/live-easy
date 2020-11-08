import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/blocs/firebase_bloc/firebase_bloc.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';
import 'package:liveeasy_huynl/handlers/padding_handler.dart';
import 'package:liveeasy_huynl/handlers/text_style_handler.dart';
import 'package:liveeasy_huynl/ui/navigation_ui.dart';
import 'package:liveeasy_huynl/ui/sub_screen/phone_auth_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  signInWithMobileNumber() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PhoneAuthScreen()));
  }

  signInWithGoogle() {
    firebaseBloc
        .signInWithGoogle()
        .then((value) => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationUI()))
            })
        .catchError((onError) =>
            {print('LoginScreen - signInWithGoogle ------------- $onError')});
  }

  signInWithFaceBook() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: kThemePrimaryColor),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kdefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _verticalSpace(0, size.height / 5),
            _logo(),
            _verticalSpace(0, 100),
            _btnSocialForm()
          ],
        ),
      ),
    ));
  }

  Widget _logo() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: kBgLogoThemePrimaryColor,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        color: kBoxShadowColor)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(kLogoIconPadding),
                child: Image.asset(
                  'assets/imgs/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            _verticalSpace(0, kdefaultPadding),
            Container(
              child: Text(
                'LIVEEASY',
                style: TextStyleHandler.logoLabel,
              ),
            ),
            Container(
              child: Text(
                'Saving time to keep life convenient!',
                style: TextStyleHandler.subLogoLabel,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _btnSocialForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _continuteWithMobileNumber(
            MdiIcons.phone,
            'Continute with Mobile Number',
            kBgSignUpMobileNumberColor,
            kSignUpMobileNumberColor),
        _continuteWithGoogle(MdiIcons.google, 'Continute with Google',
            kBgGoogleColor, kGoogleColor),
        _continuteWithFacebook(MdiIcons.facebook, 'Continute with Facebook',
            kBgFacebookColor, kFacebookColor),
      ],
    );
  }

  Widget _continuteWithMobileNumber(
      IconData icon, String text, Color bgColor, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: FlatButton(
            onPressed: () => signInWithMobileNumber(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: color,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: kdefaultPadding),
                  child: Text(
                    text,
                    style: TextStyle(color: color, fontSize: 18),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _continuteWithGoogle(
      IconData icon, String text, Color bgColor, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: FlatButton(
            onPressed: () => signInWithGoogle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: color,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: kdefaultPadding),
                  child: Text(
                    text,
                    style: TextStyle(color: color, fontSize: 18),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _continuteWithFacebook(
      IconData icon, String text, Color bgColor, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: FlatButton(
            onPressed: () => signInWithFaceBook(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: color,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: kdefaultPadding),
                  child: Text(
                    text,
                    style: TextStyle(color: color, fontSize: 18),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _verticalSpace(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
