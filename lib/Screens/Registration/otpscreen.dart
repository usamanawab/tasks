import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:task/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../BottomBar/bottom.dart';
import '../mainscreen.dart';
import 'enterphone.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key, required this.phone}) : super(key: key);
  final String phone;

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  List<FocusNode>? _focusNodes;
  List<TextEditingController>? _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(4, (_) => FocusNode());
    _controllers = List.generate(4, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers!) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/Group 56.png'),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context)!.wetext,
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
                        text: AppLocalizations.of(context)!.entercode,
                        style: const TextStyle(
                          color: Color(0xFF8B919D),
                          fontSize: 14,
                          fontFamily: 'HeadingNow-73Book',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: '  ${widget.phone}',
                        style: const TextStyle(
                          color: Color(0xFF8B919D),
                          fontSize: 14,
                          fontFamily: 'HeadingNow-75MediumItalic',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Pinput(
              length: 6,
              onChanged: (value) {
                code = value;
              },
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {



                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: EnterPhone.verification,
                            smsCode: code);
                    await FirebaseAuth.instance
                        .signInWithCredential(credential);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContainerStrokeAnimation()));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(AppLocalizations.of(context)!.success)));


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
        ),
      ),
    );
  }
}
