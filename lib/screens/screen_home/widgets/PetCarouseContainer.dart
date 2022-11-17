import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:porocci_app/styles/styles.dart';

var imgAssetsPathList = [
  "assets/images/hero/dog1.jpeg",
  "assets/images/hero/dog2.jpeg",
  "assets/images/hero/dog3.jpeg",
];

class PetCarouseContainer extends StatefulWidget {
  const PetCarouseContainer({super.key});

  @override
  State<PetCarouseContainer> createState() => _PetCarouseContainerState();
}

//! 이미지를 받아와야 하지 않을까?
//* 허어...

class _PetCarouseContainerState extends State<PetCarouseContainer> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    //! 각자 펫 이미지에[ 등록해야함
    return Container(
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
      child: CarouselSlider.builder(
        carouselController: _controller,
        itemCount: 3,
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(
          padding: AppLayout.homeContentAreaPadding,
          //* url로 받아오거나... 데이터베이스에서 가져올 수 있는 값으로 해야지
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  fit: BoxFit.cover,
                  width: 180,
                  height: 180,
                  imgAssetsPathList[itemIndex],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "펫 이름",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgAssetsPathList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      print(entry.key);
                      _controller.animateToPage(entry.key);
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//! DB에서 유저가 가진 펫 마리수를 가져와서 뿌려줘야 합니다.

class CarouselPet extends StatelessWidget {
  const CarouselPet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
