import "package:flutter/material.dart";

class PetRegisterScreen extends StatelessWidget {
  const PetRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("반려동물 등록"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: Border(bottom: BorderSide(color: Colors.black26)),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              CameraButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CameraButton extends StatelessWidget {
  const CameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //todo 카메라 기능
      },
      child: Stack(
        children: [
          Image.asset(
            "assets/images/logo/logo_rect.png",
            width: 80,
          ),
          Positioned(
              right: -4,
              bottom: -4,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(3),
                  child: Icon(IconData(0xef1e, fontFamily: 'MaterialIcons'))))
        ],
      ),
    );
  }
}
