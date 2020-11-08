import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/blocs/firebase_bloc/firebase_bloc.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';
import 'package:liveeasy_huynl/handlers/padding_handler.dart';
import 'package:liveeasy_huynl/handlers/text_style_handler.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThemePrimaryColor,
        automaticallyImplyLeading: true,
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('(+84)'),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      hintText: 'Enter your phone',
                      focusedBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(color: kThemePrimaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(color: kThemePrimaryColor),
              child: FlatButton(
                  onPressed: () {
                    if (phoneNumberController.text.startsWith('0')) {
                      phoneNumber =
                          '+84' + phoneNumberController.text.substring(1);
                    } else {
                      phoneNumber = '+84' + phoneNumberController.text;
                    }
                    firebaseBloc.signInWithMobileNumber(phoneNumber, context);
                  },
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyleHandler.confirmPhoneNumber,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
