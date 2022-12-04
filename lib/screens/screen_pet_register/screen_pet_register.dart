import "package:flutter/material.dart";
import 'package:camera/camera.dart';
import "../../styles/styles.dart";

//* 펫등록이.... 어?
//! 여기서도 되어야하는거 아니야???
// !시발
class PetRegisterScreen extends StatefulWidget {
  const PetRegisterScreen({super.key});

  @override
  State<PetRegisterScreen> createState() => _PetRegisterScreenState();
}

class _PetRegisterScreenState extends State<PetRegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _formChanged = false;
  String dropdownInitialValue = "강아지";
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
            key: formKey,
            onChanged: _onFormChange,
            onWillPop: _onWillPop,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CameraButton(),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "반려동물 이름",
                    hintText: "이름을 입력해주세요. (2~10 글자/영문/한글)",
                  ),
                  onSaved: (String? value) {},
                  validator: (value) => (value == null || value.isEmpty)
                      ? '이름을 입력해주세요. (2~10 글자/영문/한글)'
                      : null,
                ),
                DropdownButtonFormField(
                  // borderRadius: BorderRadius.circular(6),
                  decoration: InputDecoration(
                    labelText: "품/품종 선택",
                    border: OutlineInputBorder(),
                  ),
                  value: dropdownInitialValue,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownInitialValue = value!;
                    });
                  },
                  items: <String>['강아지', '고양이', 'Tiger', 'Lion']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(fontSize: 20)),
                    );
                  }).toList(),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "생년월일",
                    hintText: "YYYY-MM-DD",
                  ),
                  onSaved: (String? value) {},
                  //* /^\d{4}-\d{2}-\d{2}$/
                  validator: (value) =>
                      isDate(value!) ? null : "정확한 이메일 형식을 입력해주세요.",
                ),
                PetRadioContainer(
                    title: "성별", initialValue: "남아", options: ["남아", "여아"]),
                PetRadioContainer(
                    title: "중성화", initialValue: "완료", options: ["완료", "미완료"]),
                // IsNeuteredRadio(),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "동물 등록번호",
                    hintText: "동물 등록번호를 입력해 주세요.",
                  ),
                  onSaved: (String? value) {},
                  validator: (value) => (value == null || value.isEmpty)
                      ? '정확한 형식의 동물 등록번호를 입력해 주세요.'
                      : null,
                ),
                QRRegisterInput(),
              ],
            ),
          ),
        ),
      ),
      //todo 여기서 Formstate.state save해서 보내던가 해야함
      bottomSheet: InkWell(
        onTap: () async {
          if (formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text("등록 성공"),
              ));
          }
          // print("f");
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: BoxDecoration(color: AppColor.porochiLogoColor),
          child: Center(
              child: Text("등록하기",
                  style: TextStyle(fontSize: 20, color: Colors.white))),
        ),
      ),
    );
  }

  isDate(String value) {
    String pattern = r'^[\d]{4}-[\d]{2}-[\d]{2}$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value) ? true : false;
  }

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }

  Future<bool> _onWillPop() {
    if (!_formChanged) return Future<bool>.value(true);
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("입력을 중지하시겠습니까?\n입력 중인 모든 정보가 사라집니다."),
          actions: <Widget>[
            TextButton(
              child: Text("계속"),
              onPressed: () => Navigator.of(context).pop(false),
              style: TextButton.styleFrom(
                foregroundColor: AppColor.porochiLogoColor,
              ),
            ),
            TextButton(
              child: Text("입력 중지"),
              onPressed: () => Navigator.pop(context, true),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
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

class PetRadioContainer extends StatefulWidget {
  String title;
  String initialValue;
  List<String> options;
  PetRadioContainer({
    super.key,
    required this.title,
    required this.initialValue,
    required this.options,
  });

  @override
  State<PetRadioContainer> createState() => _PetRadioContainerState();
}

class _PetRadioContainerState extends State<PetRadioContainer> {
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
