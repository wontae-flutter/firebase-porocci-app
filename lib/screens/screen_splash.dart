import "dart:async";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porocci_app/enums/enum_auth_status.dart';
import 'package:porocci_app/models/model_login_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/provider_auth.dart';

//* 빌드 이전에 moveScreen()으로 행선지를 결정하기에 initState()가 필요합니다.
//! 이것도 바꿔볼까?

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  //! 어짜피 spalsh니까 여기서 확인하면 됨
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLogin = prefs.getBool("isLogin") ?? false;

    // 이제 prefs에서 loginField를 가져와야 함
    if (isLogin) {
      String email = prefs.getString("email")!;
      String password = prefs.getString("password")!;
      var loginField = LoginField(email: email, password: password);
      final loginStatus = ref.watch(loginStatusProvider(loginField)).value;

      if (loginStatus == AuthStatus.loginSuccess) {
        print("로그인 성공");
      } else {
        print("로그인 실패");
        prefs.setBool("isLogin", false);
      }
    }
    return isLogin;
  }

  void moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
        print('로그인 완료');
        Navigator.of(context).pushReplacementNamed("/index");
      } else {
        print('로그인 미완료');
        Navigator.of(context).pushReplacementNamed("/login");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      moveScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
