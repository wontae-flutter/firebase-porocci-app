import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';

import "./widgets/widgets.dart";
import '../../providers/provider_auth.dart';
import '../../styles/styles.dart';
import "../../enums/enum_user_type.dart";

class MyPageScreen extends ConsumerStatefulWidget {
  const MyPageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends ConsumerState<MyPageScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // String uid;
  // String name;
  // String email;
  // String nickname;
  // int type;
  // String image;

  //* 이미지를 가져와야지...

  //* user 프로바이더로 가져오면 됩니다...... 모델 프로바이더 어떻게 하더라??, no
  bool _formChanged = false;
  String usertype = "보호자";

  @override
  Widget build(BuildContext context) {
    final authRepository = ref.watch(authRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("마이페이지"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      // endDrawer: Drawer(),
      body: Center(
        child: Padding(
          padding: AppLayout.formPageContainerPadding,
          child: Form(
            key: formKey,
            onChanged: _onFormChange,
            onWillPop: _onWillPop,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: MainLogo(),
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "이름",
                    hintText: "이름을 입력해주세요.",
                  ),
                  onSaved: (String? value) {},
                  validator: (value) =>
                      (value == null || value.isEmpty) ? '이름을 입력해주세요.' : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "이메일",
                    hintText: "이메일을 입력해주세요.",
                  ),
                  onSaved: (String? value) {},
                  validator: (value) =>
                      isEmail(value!) ? null : "정확한 이메일 형식을 입력해주세요.",
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "닉네임",
                    hintText: "닉네임을 입력해주세요.",
                  ),
                  onSaved: (String? value) {},
                  validator: (value) =>
                      (value == null || value.isEmpty) ? '닉네임을 입력해주세요.' : null,
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "역할",
                      style: TextStyle(color: Colors.grey),
                    ),
                    FormField(builder: (context) {
                      return Row(
                        children: [
                          Radio(
                            value: "보호자",
                            groupValue: usertype,
                            onChanged: (inValue) {
                              setState(() {
                                usertype = inValue!;
                              });
                            },
                          ),
                          Text("보호자"),
                          Radio(
                            value: "수의사",
                            groupValue: usertype,
                            onChanged: (inValue) {
                              setState(() {
                                usertype = inValue!;
                              });
                            },
                          ),
                          Text("수의사")
                        ],
                      );
                    }),
                    Visibility(
                      visible: usertype == "수의사",
                      child: VetCertificateRegisterButton(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: _formChanged
            ? () async {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      content: Text("등록 성공"),
                    ));
                  //* onSaved도 필요함,. 각각으로?
                }
              }
            : null,
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

  isEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
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

//! 나중에 form으로 돌아올 수 있게, 이미지를 올리는 법
class VetCertificateRegisterButton extends StatelessWidget {
  const VetCertificateRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(80, 30, 80, 30),
      height: 320,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              //! 이미지 올리는 Form이 있어야 하는데...
            },
            child: Icon(
              IconData(0xee3c, fontFamily: 'MaterialIcons'),
              size: 70,
              color: Colors.black38,
            ),
          ),
          Text(
            "수의사 면허증 등록하기",
            style: AppText.homeScreenTitle,
          ),
          // SizedBox(height: 10),
        ],
      ),
    );
  }
}
