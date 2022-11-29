import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

Map<String, dynamic> petInfos = {
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

class PetInfoTab extends StatelessWidget {
  const PetInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    // print(petInfos.values.toList()[1]);
    return Center(
      child: Container(
          padding: AppLayout.tabContainerPadding,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: AppBox.onlyTopCircularBorder,
                child: Image.network(
                  petInfos["image"],
                  fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
              //! 나중에 Futurebuilder로 circulrar
              //! 일단 여기서 UI만 잡기로 했자나 그지?
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: AppColor.homeScreenBackgroundColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                    border: Border.all(width: 1, color: Colors.black38),
                  ),
                  child: Padding(
                    padding: AppLayout.tabContentPadding,
                    child: SizedBox.expand(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(petInfos["name"],
                                  style: AppText.petCertificateTitle),
                            ),
                            SizedBox(height: 5),
                            Text.rich(TextSpan(
                              text: "🎂",
                              style: AppText.tableBody,
                              children: [
                                TextSpan(
                                  text: petInfos["birthdate"],
                                )
                              ],
                            )),
                            Text.rich(TextSpan(
                              text: "성별: ",
                              style: AppText.tableBody,
                              children: [
                                TextSpan(
                                  text: petInfos["sex"],
                                )
                              ],
                            )),
                            Text.rich(TextSpan(
                              text: "중성화 여부: ",
                              style: AppText.tableBody,
                              children: [
                                TextSpan(
                                  text: petInfos["isNeutered"],
                                )
                              ],
                            )),
                            Text.rich(TextSpan(
                              text: "동물 등록번호: ",
                              style: AppText.tableBody,
                              children: [
                                TextSpan(
                                  text: petInfos["registernumber"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            )),
                            SizedBox(height: 5),
                            Text(
                              "알러지: ${petInfos["allergies"]}",
                              style: AppText.tableAccent,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppColor.porochiLogoColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                petInfos["remarks"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ]),
                    ),
                  ))
            ],
          )),
    );
  }
}
