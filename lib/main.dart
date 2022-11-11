import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import './screens/screens.dart';

// final sharedPreferences =
//     Provider<SharedPreferences>((_) => throw UnimplementedError());

Future<void> main() async {
  //! sharedPreferences처럼 객체가 Future일 때 futureProvider를 사용하기 싫을 때

  // final sharedPrefs = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    ProviderScope(
      // overrides: [
      //   sharedPreferences.overrideWithValue(sharedPrefs),
      // ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porocci',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/login": (context) => const LoginScreen(),
        "/index": (context) => const IndexScreen(),
        "/register": (context) => const RegisterScreen(),
      },
    );
  }
}

// 로그아웃을 만들어야겠음