import "package:flutter/material.dart";
import './widgets/widgets.dart';
import "../../styles/styles.dart";

//* stf
class PetRegisterScreen extends StatefulWidget {
  const PetRegisterScreen({super.key});

  @override
  State<PetRegisterScreen> createState() => _PetRegisterScreenState();
}

class _PetRegisterScreenState extends State<PetRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //todo 일단 focusNode는 제외하자

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("반려동물 등록"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: Border(bottom: BorderSide(color: Colors.black26)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
      ),
      body: Center(
        child: Container(
          padding: AppLayout.formPageContainerPadding,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CameraButton(),
                NameInput(),
                BreedDropDown(),
                BirthdateInput(),
                RadioContainer(
                    title: "성별", initialValue: "남아", options: ["남아", "여아"]),
                RadioContainer(
                    title: "중성화", initialValue: "완료", options: ["완료", "미완료"]),
                // IsNeuteredRadio(),
                RegisterInput(),
                QRRegisterInput(),
              ],
            ),
          ),
        ),
      ),
      //todo 여기서 Formstate.state save해서 보내던가 해야함
      bottomSheet: InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration: BoxDecoration(color: AppColor.porochiLogoColor),
            child: Center(
                child: Text("등록하기",
                    style: TextStyle(fontSize: 20, color: Colors.white))),
          )),
    );
  }
}
//todo 엄청난 form이 들어갈 것 같군요...

class CameraButton extends StatelessWidget {
  const CameraButton({super.key});

  //todo 얘도 이미지 폼이어야하네...
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

class NameInput extends StatelessWidget {
  const NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "반려동물 이름",
        hintText: "이름을 입력해주세요. (2~10 글자/영문/한글)",
      ),
      onSaved: (String? value) {},
      validator: (value) {},
    );
  }
}

class BreedDropDown extends StatefulWidget {
  const BreedDropDown({super.key});

  @override
  State<BreedDropDown> createState() => _BreedDropDownState();
}

class _BreedDropDownState extends State<BreedDropDown> {
  @override
  Widget build(BuildContext context) {
    String initialValue = "강아지";

    return DropdownButtonFormField(
      // borderRadius: BorderRadius.circular(6),
      decoration: InputDecoration(
        labelText: "품/품종 선택",
        border: OutlineInputBorder(),
      ),
      value: initialValue,
      onChanged: (String? value) {
        setState(() {
          value = initialValue;
        });
      },
      items: <String>['강아지', '고양이', 'Tiger', 'Lion']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(fontSize: 20)),
        );
      }).toList(),
    );
  }
}

class BirthdateInput extends StatelessWidget {
  const BirthdateInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "생년원일",
        hintText: "YYYY-MM-DD",
      ),
      onSaved: (String? value) {},
      validator: (value) {},
    );
  }
}

class RadioContainer extends StatefulWidget {
  String title;
  String initialValue;
  List<String> options;
  RadioContainer({
    super.key,
    required this.title,
    required this.initialValue,
    required this.options,
  });

  @override
  State<RadioContainer> createState() => _RadioContainerState();
}

class _RadioContainerState extends State<RadioContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.title,
        style: TextStyle(color: Colors.grey),
      ),
      FormField(builder: (context) {
        return Row(
          children: [
            Radio(
              value: widget.options[0],
              groupValue: widget.initialValue,
              onChanged: (inValue) {
                setState(() {
                  widget.initialValue = inValue!;
                });
              },
            ),
            Text(widget.options[0]),
            Radio(
              value: widget.options[1],
              groupValue: widget.initialValue,
              onChanged: (inValue) {
                setState(() {
                  widget.initialValue = inValue!;
                });
              },
            ),
            Text(widget.options[1])
          ],
        );
      }),
    ]);
  }
}

class RegisterInput extends StatelessWidget {
  const RegisterInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "동물 등록번호",
        hintText: "동물 등록번호를 입력해 주세요.",
      ),
      onSaved: (String? value) {},
      validator: (value) {},
    );
  }
}

class QRRegisterInput extends StatelessWidget {
  const QRRegisterInput({super.key});

  //todo 이것도 버튼이 있으려나?
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed("/qr");
      },
      child: Text(
        "QR 찍기",
      ),
    );
  }
}
