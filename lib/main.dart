import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import './screens/screens.dart';

// final sharedPreferences =
//     Provider<SharedPreferences>((_) => throw UnimplementedError());

Future<void> main() async {
  //! sharedPreferences처럼 객체가 Future일 때 futureProvider를 사용하기 싫을 때

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    ProviderScope(
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
        "/home": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/user_page": (context) => const UserPageScreen(),
        //! 각각 펫아이디에 해줘야하는데, 요거는 넘버링하지않고 유저아이디 + 펫아이디가 합쳐져있어야 할 것 같아요.
        "/pet_tabs": (context) => const PetTabsScreen(),
      },
    );
  }
}

// 로그아웃을 만들어야겠음