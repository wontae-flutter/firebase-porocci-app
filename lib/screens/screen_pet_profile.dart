import 'package:flutter/material.dart';
import '../tabs/tabs_pet.dart';

class PetProfileScreen extends StatefulWidget {
  const PetProfileScreen({super.key});

  @override
  State<PetProfileScreen> createState() => _PetProfileScreenState();
}

class _PetProfileScreenState extends State<PetProfileScreen> {
  int _currentTabIndex = 0;

  final List<Widget> _tabs_pet = [
    PetInfoTab(),
    PetCertificateTab(),
    PetVaccineHistoryTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pet name"),
        bottom: TabBar(
          tabs: _tabs_pet,
        ),
      ),
      body: TabBarView(
        children: _tabs_pet,
      ),
    );
  }
}


//  bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         iconSize: 30,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _currentTabIndex,
//         selectedLabelStyle: TextStyle(fontSize: 12),
//         onTap: (index) async {
//           print(await sharedPrefRepository.getIsAutoLogin());
//           setState(() {
//             _currentTabIndex = index;
//             print(_currentTabIndex);
//             //* 지금은 서치탭이 없죠!
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
//           BottomNavigationBarItem(
//               icon: Icon(IconData(0xe4a1, fontFamily: 'MaterialIcons')),
//               label: '마이펫'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
//         ],
//       ),
//       body: _tabs[_currentTabIndex],