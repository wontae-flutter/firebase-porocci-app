import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums/enum_auth_status.dart';
import '../../providers/provider_auth.dart';
import '../../styles/styles.dart';
import './widgets/widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //! final userPets = ref.watch(userPetsProvider);
    //! 요거는 리스트로 만들기 쉽다...
    // final loginStatus = ref.watch(loginStatusProvider);
    // 안되는 ㅜㅜ

    // print("loginStatus: $loginStatus");
    //* 유저 로그인해서 마이페이지 or 로그인 해야함
    // final loginStatus = ref.watch(loginStatusProvider);
    // print("isLogin at HomeScreen: $isLogin");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(IconData(0xf237, fontFamily: 'MaterialIcons'))),
          // IconButton(
          //   onPressed: () {
          //     loginStatus == AuthStatus.loggedIn
          //         ? Navigator.of(context).pushNamed("/user_page")
          //         : Navigator.of(context).pushNamed("/login");
          //   },
          //   icon: loginStatus == AuthStatus.loggedIn
          //       ? Icon(
          //           IconData(0xee35, fontFamily: 'MaterialIcons')) //* User Icon
          //       : Icon(IconData(0xe3b2,
          //           fontFamily: 'MaterialIcons')), //* Login Icon
          // )
        ],
      ),
      extendBodyBehindAppBar: true, //* body위에 appbar
      body: Container(
        color: AppColor.homeScreenBackgroundColor,
        child: Column(
          children: [
            HeroImageSection(),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, -30),
                child: HomeArea(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
