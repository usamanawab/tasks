import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task/Screens/BottomBar/bottom.dart';
import 'package:task/Screens/Registration/enterphone.dart';
import 'Provider/appProvider.dart';
import 'Screens/Home/home.dart';
import 'Screens/mainscreen.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'Screens/Registration/otpscreen.dart';


void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAbCiW_JDrVC7deArPcOFd8bYdKcHtSGBo',
          appId: '1:788195008902:web:d25ee118ab89fe69ab0c07',
          messagingSenderId: '788195008902',
          projectId: 'task-9bb2b',
          iosBundleId: 'com.example.task',
          storageBucket: 'task-9bb2b.appspot.com'),
    );

  } catch (e) {
    print(e.toString());
  }
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appProvider=Provider.of<AppProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task',
      locale: appProvider.locale,
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: EnterPhone(),
    );
  }
}

