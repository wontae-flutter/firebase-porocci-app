import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider_shared_preferences.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    // final sharedPrefRepository = ref.watch(sharedPrefRepositoryProvider);
    //* 유저 로그인해서 마이페이지 or 로그인 해야함
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(IconData(0xf237, fontFamily: 'MaterialIcons'))),
          IconButton(
            onPressed: () {},
            icon: isLogin
                ? Icon(IconData(0xe3b2,
                    fontFamily: 'MaterialIcons')) //* Login Icon
                : Icon(IconData(0xee35,
                    fontFamily: 'MaterialIcons')), //* User Icon
          ),
        ],
      ),
      extendBodyBehindAppBar: true, //* body위에 appbar
      body: Column(
        children: [
          Stack(
            children: [
              HeroImage(),
              Positioned(
                bottom: 5,
                right: 5,
                child: HeroImageEditButton(),
              )
            ],
          ),
          HomeArea(),
        ],
      ),
      //   body: Stack(
      //     children: [
      //       Container(
      //         // height: double.infinity,
      //         // height: MediaQuery.of(context).size.height * 0.,
      //         child: Image.asset(
      //           // height: MediaQuery.of(context).size.height * 0.5,
      //           "assets/images/hero/dog.jpeg",
      //           fit: BoxFit.fill,
      //         ),
      //       ),
      //       Positioned(
      //         top: MediaQuery.of(context).size.height * 0.35,
      //         //* clip이랑 Container랑 바뀐꺼같음
      //         child: Container(
      //           width: MediaQuery.of(context).size.width,
      //           height: MediaQuery.of(context).size.height * 0.55,
      //           child: Text("Hoi"),
      //           color: Colors.red,
      //         ),
      //         // child: ClipRRect(
      //         //   borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
      //         //   child: Container(
      //         //     width: MediaQuery.of(context).size.width,
      //         //     child: Text("Hoi"),
      //         //     color: Colors.red,
      //         //   ),
      //         // ),
      //       )
      //     ],
      //   ),
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      height: MediaQuery.of(context).size.height * 0.4,
      "assets/images/hero/dog.jpeg",
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
        color: Colors.black12,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
      child: Column(
        children: [
          QRContainer(),
          SizedBox(height: 30),
          Stack(
            children: [
              PetRegisterTitle(),
              Positioned(
                child: PetRegister(),
              )
            ],
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
    return Row(
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
    );
  }
}

class PetRegister extends StatelessWidget {
  const PetRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(80, 30, 80, 10),
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
        children: [
          Icon(
            IconData(0xee3c, fontFamily: 'MaterialIcons'),
            size: 60,
            color: Colors.black38,
          ),
          Text(
            "+ 포로치 등록하기",
            style: TextStyle(),
          ),
          SizedBox(height: 5),
          Text(
            "포로치의 반려동물 등록번호를 연동시켜주세요.",
            style: TextStyle(),
          ),
        ],
      ),
    );
  }
}
