import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enums/enum_auth_status.dart';
import '../providers/provider_auth.dart';
import '../styles/styles.dart';

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
            Stack(
              children: [
                HeroImage(),
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: HeroImageEditButton(),
                )
              ],
            ),
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

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      height: MediaQuery.of(context).size.height * 0.4,
      "assets/images/hero/dog3.jpeg",
      fit: BoxFit.cover,
    );
  }
}

class HeroImageEditButton extends StatelessWidget {
  const HeroImageEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          print("홈커버 편집 - 미완성된 기능");
        },
        child: Text(
          "홈커버 편집",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
            decoration: TextDecoration.underline,
          ),
        ));
  }
}

class HomeArea extends StatelessWidget {
  const HomeArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.homeScreenBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      padding: EdgeInsets.fromLTRB(30, 50, 30, 40),
      child: Column(
        children: [
          QRContainer(),
          SizedBox(height: 30),
          PetRegisterTitle(),
          SizedBox(height: 10),
          Expanded(
            child: PetRegisterContainer(),
          )
        ],
      ),
    );
  }
}

class QRContainer extends StatelessWidget {
  const QRContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //* OnGestureDectector()로 하면 되겠다
    return GestureDetector(
      onTap: () {
        print("QR 페이지로 넘어가세요!");
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
            border: Border.all(width: 1, color: Colors.black38),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 2.0)), // shadow direction: bottom right),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              IconData(0xe4f7, fontFamily: 'MaterialIcons'),
              size: 60,
            ),
            SizedBox(width: 10),
            Text(
              "QR 확인하기",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class PetRegisterTitle extends StatelessWidget {
  const PetRegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.pets,
            size: 50,
          ),
          SizedBox(width: 10),
          Text(
            "반려동물 등록",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class PetRegisterContainer extends StatelessWidget {
  const PetRegisterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(80, 30, 80, 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.black12),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 2,
                spreadRadius: 2.0,
                offset: Offset(2.0, 2.0)), // shadow direction: bottom right),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            IconData(0xee3c, fontFamily: 'MaterialIcons'),
            size: 70,
            color: Colors.black38,
          ),
          Text(
            "포로치 등록하기",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          // SizedBox(height: 10),
          Text(
            "포로치의 반려동물 \n 등록번호를 연동시켜주세요.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, fontSize: 18),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/pet_tabs");
            },
            child: Text("펫 프로필"),
          ),
        ],
      ),
    );
  }
}
