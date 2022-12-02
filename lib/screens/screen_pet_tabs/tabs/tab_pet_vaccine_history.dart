import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/widgets.dart';
import '../../../styles/styles.dart';

//! provider로 이미지만 가져오는 petImageProvider가 필요하겠네
Map<String, dynamic> petInfos3 = {
  "breed": "요크셔테리아",
  "image":
      "https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg",
  "name": "심바",
  "sex": "여",
  "birthdate": "2022-06-01",
  "registernumber": "410-11111111",
  "isNeutered": "안함",
  "allergies": "닭, 견과류, 호두, 참치",
  "remarks": "나뭇가지를 잘 물고 다녀요."
};

List<List<String>> vaccineInfo2 = [
  [
    "종합예방접종 (DHPPL)",
    "5",
    "2022.10.01",
    "설동준",
    "2023.01.01",
  ],
  [
    "코로나바이러스장염(Coronavirus) ",
    "5",
    "2022.10.01",
    "설동준",
    "2023.01.01",
  ],
  [
    "기관ㆍ기관지염(Kennel Cough)",
    "5",
    "2022.10.01",
    "설동준",
    "2023.01.01",
  ],
  [
    "독감접종(Influenza)",
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

class PetVaccineHistoryTab extends ConsumerStatefulWidget {
  const PetVaccineHistoryTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PetVaccineHistoryTabState();
}

class _PetVaccineHistoryTabState extends ConsumerState<PetVaccineHistoryTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: AppLayout.tabContainerPadding,
        child: Column(
          children: [
            DogImage(image: petInfos3['image']),
            SizedBox(height: 15),
            Text(
              "예방접종 내역",
              style: AppText.homeScreenTitle,
            ),
            SizedBox(height: 15),
            VaccineHistoryTitle(),
            SizedBox(height: 15),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return VaccineListTile(
                    vaccineName: vaccineInfo2[index][0],
                    dose: vaccineInfo2[index][1],
                    date: vaccineInfo2[index][2],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: 7,
              ),
            ),
            SizedBox(height: 15),
            Visibility(
              visible: true,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/vaccine_history_update");
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColor.blue,
                    border: Border.all(color: AppColor.blue),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  width: 180,
                  child: Text(
                    "접종내역 업데이트",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VaccineHistoryTitle extends StatelessWidget {
  const VaccineHistoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: _buildTitle("백신 이름")),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              child: _buildTitle("차수")),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: _buildTitle("다음 예정일")),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.blue,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

class VaccineListTile extends StatelessWidget {
  String vaccineName;
  String dose;
  String date;

  VaccineListTile({
    super.key,
    required this.vaccineName,
    required this.dose,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.blue),
        color: AppColor.skyblue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(vaccineName)),
          VerticalDivider(color: Colors.white, thickness: 3.0),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(dose, textAlign: TextAlign.center)),
          VerticalDivider(color: Colors.white, thickness: 3.0),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(date, textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}
