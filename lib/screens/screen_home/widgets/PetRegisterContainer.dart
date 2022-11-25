import "package:flutter/material.dart";
import "../../../styles/styles.dart";

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
        ],
      ),
    );
  }
}
