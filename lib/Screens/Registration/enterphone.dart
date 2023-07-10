import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task/Screens/BottomBar/bottom.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../Provider/appProvider.dart';
import 'otpscreen.dart';

class EnterPhone extends StatefulWidget {
  static String verification = '';

  @override
  State<EnterPhone> createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  final formkey = GlobalKey<FormState>();

  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appProvider=Provider.of<AppProvider>(context,listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: (){
                if (appProvider.locale.languageCode == 'ar') {
                  setState(() {
                    appProvider.locale = const Locale('en');
                  });
                } else {
                  setState(() {
                    appProvider.locale = const Locale('ar');
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset('assets/Clip path group.png'),
                ),
              ),
            ),
            Image.asset('assets/Group 63.png'),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context)!.welcome,
                  style: TextStyle(
                    color: Color(0xFF07052A),
                    fontSize: 20,
                    fontFamily: 'HeadingNow-74Regular',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.enter,
                        style: const TextStyle(
                          color: Color(0xFF8B919D),
                          fontSize: 14,
                          fontFamily: 'HeadingNow-73Book',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.find,
                        style: const TextStyle(
                          color: Color(0xFF8B919D),
                          fontSize: 14,
                          fontFamily: 'HeadingNow-75MediumItalic',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context)!.phone,
                  style: const TextStyle(
                    color: Color(0xFF07052A),
                    fontSize: 20,
                    fontFamily: 'HeadingNow-74Regular',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.enterphone;
                              }
                            },
                            controller: phone,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                hintText: "+966",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          if (formkey.currentState!.validate()) {


                            showDialog(context: context, builder: (context){
                              return const Center(child: CircularProgressIndicator(),);
                            });


                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: phone.text.toString(),
                                verificationCompleted: (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException e) {},
                                codeSent: (String verificationId, int? resendToken) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text('code has been sent to your number')));

                                  Navigator.pop(context);
                                  EnterPhone.verification=verificationId;
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPPage(phone:phone.text.toString() )));

                                },
                                codeAutoRetrievalTimeout: (String verificationId) {},
                              );


                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          width: 398,
                          height: 56,
                          decoration: ShapeDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment(0.83, 0.56),
                              end: Alignment(-0.83, -0.56),
                              colors: [Color(0xFF6633FF), Color(0xFF20BD52)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.continues,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'HeadingNow-74Regular',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
