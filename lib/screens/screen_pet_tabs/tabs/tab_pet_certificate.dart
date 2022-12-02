import 'package:flutter/material.dart';
import '../../../styles/styles.dart';
import '../widgets/widgets.dart';

//* 백신 어떻게 될까... 펫으로 한번에 합쳐야 되나? 아마 한번에 합치면 안될 것 같아. 두개 나눠서 하자
//* 나중에 프로바이더로 받을 것
Map<String, dynamic> petInfos2 = {
  "breed": "요크셔테리아",
  "image":
      "https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg",
  "name": "심바",
  "sex": "여",
  "birthdate": "2022-06-01",
  "registernumber": "410-11111111",
  "isNeutered": "안함",
  "allergies": "닭, 견과류, 호두, 참치",
  "remarks": "귀여움"
};

//* 이것도 나중에 프로바이더로 가능함

//* 접종차수 dose, date, vet, nextdate
//* 리스트도 가능? 문서로 받아오자너
//! 이것도 datetime으로 해야되네..

List<List<String>> vaccineInfo = [
  [
    "종합예방접종\n(DHPPL)",
    "5",
    "2022.10.01",
    "설동준",
    "2023.01.01",
  ],
  [
    "코로나바이러스장염\n(Coronavirus) ",
    "5",
    "2022.10.01",
    "설동준",
    "2023.01.01",
  ],
  [
    "기관ㆍ기관지염\n(Kennel Cough)",
    "5",
    "2022.10.01",
    "설동준",
    "2023.01.01",
  ],
  [
    "독감접종\n(Influenza)",
    "5",
    "2022.10.01",
    "설동준",
    "2023.01.01",
  ],
  [
    "심장사상충 및 내부기생충",
    "5",
    "2022.10.01",
    "설동준",
    "2023.01.01",
  ],
  [
    "외부기생충",
    "5",
    "2022.10.01",
    "설동준",
    "2023.01.01",
  ],
  [
    "광견병",
    "5",
    "2022.10.01",
    "설동준",
    "2023.01.01",
  ],
];
// List.generate

class PetCertificateTab extends StatelessWidget {
  const PetCertificateTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: AppLayout.tabContainerPadding,
        //* 이거 스택으로 만들어야함
        child: Column(
          children: [
            DogImage(image: petInfos2["image"]),
            SizedBox(height: 15),
            VaccineCardContainer(),
          ],
        ),
      ),
    );
  }
}

class VaccineCardContainer extends StatelessWidget {
  const VaccineCardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColor.skyblue,
      ),
      padding: AppLayout.tabContentPadding,
      //* Stack 필요...
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "예방접종 증명내역서",
            style: TextStyle(
              color: AppColor.blue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: MediaQuery.of(context).size.height * 0.49,
            child: ListView.separated(
              itemCount: vaccineInfo.length,
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                return VaccineCard(
                  vaccineName: vaccineInfo[index][0],
                  dose: vaccineInfo[index][1],
                  date: vaccineInfo[index][2],
                  vet: vaccineInfo[index][3],
                  nextdate: vaccineInfo[index][4],
                );
                // return Text("hi");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class VaccineCard extends StatelessWidget {
  //* 접종차수 dose, date, vet, nextdate
  String vaccineName;
  String dose;
  String date;
  String vet;
  String nextdate;
  VaccineCard({
    super.key,
    required this.vaccineName,
    required this.dose,
    required this.date,
    required this.vet,
    required this.nextdate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: AppColor.homeScreenBackgroundColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(width: 1, color: Colors.black38),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              color: AppColor.blue,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  vaccineName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "접종차수",
                          style: AppText.tableAccent,
                        ),
                        Row(children: [
                          Text(
                            "${dose}차",
                            style: AppText.tableBody,
                          ),
                          SizedBox(width: 4),
                          CheckMark()
                        ]),
                        Text(
                          "담당 수의사",
                          style: AppText.tableAccent,
                        ),
                        Text(
                          vet,
                          style: AppText.tableBody,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "접종일자",
                          style: AppText.tableAccent,
                        ),
                        Text(
                          date,
                          style: AppText.tableBody,
                        ),
                        Text(
                          "다음 예정일",
                          style: AppText.tableAccent,
                        ),
                        Text(
                          nextdate,
                          style: AppText.tableBody,
                        ),
                      ],
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class CheckMark extends StatelessWidget {
  const CheckMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -4),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        decoration: BoxDecoration(
          color: Color(0xffbbddff),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              IconData(0xe15a, fontFamily: 'MaterialIcons'),
              size: 16,
              color: Color(0xff74abf3),
            ),
            SizedBox(width: 4),
            Text(
              "접종완료",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
