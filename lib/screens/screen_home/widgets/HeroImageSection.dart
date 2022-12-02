import 'package:flutter/material.dart';
import '../../../styles/styles.dart';

class HeroImageSection extends StatelessWidget {
  const HeroImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeroImage(),
        Positioned(
          bottom: 30,
          right: 5,
          child: HeroImageEditButton(),
        )
      ],
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
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.blue),
        onPressed: () {
          print("홈커버 편집 - 미완성된 기능");
        },
        child: Text(
          "홈커버 편집",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
            // decoration: TextDecoration.underline,
          ),
        ));
  }
}
