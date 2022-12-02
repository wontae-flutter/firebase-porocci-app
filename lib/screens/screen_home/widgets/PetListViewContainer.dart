import "package:flutter/material.dart";
import "../../../styles/styles.dart";

//todo 나중에 userPetsProfiles
var imgAssetsPathList = [
  "assets/images/hero/dog1.jpeg",
  "assets/images/hero/dog2.jpeg",
  "assets/images/hero/dog3.jpeg",
  "assets/images/hero/dog3.jpeg",
];
//! 프로바이더에서, 아무것도 없으면 저 이미지를 가져오게끔 하면 됩니다.

//! OwnerPet, 이렇게 가져오면 되지
//! 어떻게든 이미지를 가져오지 않을까?

var userPetsNames = [
  "멍이",
  "코냑",
  "핸드크림",
  "열쇠",
];

//! 나중에 튜플로 받든 말든... 시벌!

class PetListViewContainer extends StatelessWidget {
  const PetListViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return imgAssetsPathList.length == 0
        ? PetPlaceHolder()
        : ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: imgAssetsPathList.length,
            itemBuilder: (context, index) {
              return PetProfileButton(
                  petProfile: imgAssetsPathList[index],
                  petName: userPetsNames[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 20);
            },
          );
  }
}

class PetProfileButton extends StatelessWidget {
  String petProfile;
  String petName;
  PetProfileButton({
    super.key,
    required this.petProfile,
    required this.petName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/pet_tabs");
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[300]),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(petProfile),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            petName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class PetPlaceHolder extends StatelessWidget {
  const PetPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[300]),
            ),
            Positioned(
              left: 10,
              top: 10,
              child: SizedBox(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/hero/placeholder_dog.png"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
