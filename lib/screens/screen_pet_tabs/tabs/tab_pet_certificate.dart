import 'package:flutter/material.dart';
import '../../../styles/styles.dart';

Map<String, dynamic> petCertificate = {
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
              ClipRRect(
                borderRadius: AppBox.onlyTopCircularBorder,
                //* 아래로 하라고? 카드가 여러개가 있겠구만...
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColor.porochiLogoColor,
                          Color(0xff7195fb),
                        ],
                      )),
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: Image.asset(
                        "assets/images/logo/logo_rect.png",
                        fit: BoxFit.fitHeight,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 90,
                      child: Text(
                        "ANimALYZE",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 30,
                      child: Text(
                        "종합백신 (DHPPL)\n예방접종 증명서",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //! 나중에 Futurebuilder로 circulrar
              //! 일단 여기서 UI만 잡기로 했자나 그지?
              Container(
                padding: AppLayout.tabContentPadding,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: AppColor.homeScreenBackgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                  border: Border.all(width: 1, color: Colors.black38),
                ),

                //! ok, I'll make to table!
                //! 접종완료 하려면 Text.rich를 써야하긴 할거같음
                child: SizedBox.expand(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "접종차수",
                              style: AppText.tableHeader,
                            ),
                            Row(children: [
                              Text(
                                "${5}차",
                                style: AppText.tableBody,
                              ),
                              SizedBox(width: 4),
                              CheckMark()
                            ]),
                            Text(
                              "담당 수의사",
                              style: AppText.tableHeader,
                            ),
                            Text(
                              "설동준",
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
                              style: AppText.tableHeader,
                            ),
                            Text(
                              "2022-10-11",
                              style: AppText.tableBody,
                            ),
                            Text(
                              "다음 예정일",
                              style: AppText.tableHeader,
                            ),
                            Text(
                              "2023-02-02",
                              style: AppText.tableBody,
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          )),
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

  //! 빨간색일때는 어떻게 해?
}
