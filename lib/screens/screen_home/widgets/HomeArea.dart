import 'package:flutter/material.dart';
import '../../../styles/styles.dart';
import 'PetCarouseContainer.dart';

class HomeArea extends StatelessWidget {
  //! 나중에 로그인!!!!!
  HomeArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.homeScreenBackgroundColor,
        borderRadius: AppBox.onlyTopCircularBorder,
      ),
      padding: EdgeInsets.fromLTRB(30, 50, 30, 40),
      child: Column(
        children: [
          QRContainer(),
          SizedBox(height: 30),
          PetRegisterTitle(),
          SizedBox(height: 10),
          Expanded(
            //! 로그인 유무가 아니라 동물이 있는지 없는지 유무가 중요하다
            child: false ? PetRegisterContainer() : PetCarouseContainer(),
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
        Navigator.of(context).pushNamed("/qr");
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
              style: AppText.homeScreenTitle,
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
            "반려동물",
            style: AppText.homeScreenTitle,
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
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("/pet_register");
            },
            child: Icon(
              IconData(0xee3c, fontFamily: 'MaterialIcons'),
              size: 70,
              color: Colors.black38,
            ),
          ),
          Text(
            "포로치 등록하기",
            style: AppText.homeScreenTitle,
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
