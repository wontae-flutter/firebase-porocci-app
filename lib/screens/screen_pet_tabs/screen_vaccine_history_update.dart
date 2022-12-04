import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../styles/styles.dart';

List<String> vaccineList = [
  "종합예방접종(DHPPL)",
  "코로나바이러스장염(Coronavirus)",
  "기관ㆍ기관지염 (Kennel Cough)",
  "독감접종 (Influenza)",
  "심장사상충 및 내부기생충",
  "외부기생",
  "광견",
];

List<int> doseList = List.generate(250, (index) => index);

class VaccineHistoryUpdateScreen extends StatefulWidget {
  const VaccineHistoryUpdateScreen({super.key});

  @override
  State<VaccineHistoryUpdateScreen> createState() =>
      _VaccineHistoryUpdateScreenState();
}

class _VaccineHistoryUpdateScreenState
    extends State<VaccineHistoryUpdateScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _formChanged = false;

  int selectedVaccineIndex = 0;
  int selectedDoseIndex = 0;

  var selectedDate = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  //* 차수도 해야되는데.... 이거는 똑같이 하구 200???

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("접종내역 업데이트"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: Border(bottom: BorderSide(color: Colors.black26)),
      ),
      body: Center(
          child: Container(
        padding: AppLayout.formPageContainerPadding,
        child: Form(
          key: formKey,
          onChanged: _onFormChange,
          onWillPop: _onWillPop,
          child: Column(
            children: [
              ElevatedButton(
                  child: Text(
                      'Selected fruit: ${vaccineList[selectedVaccineIndex]}'),
                  onPressed: () => _showDialog(CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: 32,
                        onSelectedItemChanged: (int selectedItemIndex) {
                          setState(() {
                            selectedVaccineIndex = selectedItemIndex;
                          });
                        },
                        children: List<Widget>.generate(vaccineList.length,
                            (int index) {
                          return Center(
                            child: Text(
                              vaccineList[index],
                            ),
                          );
                        }),
                      ))),
              ElevatedButton(
                  child: Text('Selected dose: ${doseList[selectedDoseIndex]}'),
                  onPressed: () => _showDialog(CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: 32,
                        onSelectedItemChanged: (int selectedItemIndex) {
                          setState(() {
                            selectedDoseIndex = selectedItemIndex;
                          });
                        },
                        children:
                            List<Widget>.generate(doseList.length, (int index) {
                          return Center(
                            child: Text(
                              "${doseList[index]}",
                            ),
                          );
                        }),
                      ))),
              ElevatedButton(
                child: Text("Select Date: ${formatter.format(selectedDate)}"),
                onPressed: () => _showDialog(CupertinoDatePicker(
                  initialDateTime: selectedDate,
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() => selectedDate = newDate);
                  },
                )),
              )
            ],
          ),
        ),
      )),
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
