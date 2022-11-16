import 'package:flutter/material.dart';
import '../tabs/tabs_pet.dart';

class PetTabsScreen extends StatefulWidget {
  const PetTabsScreen({super.key});

  @override
  State<PetTabsScreen> createState() => _PetTabsScreenState();
}

class _PetTabsScreenState extends State<PetTabsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentTabIndex = 0;

  final List<Widget> _tabs_pet = [
    PetInfoTab(),
    PetCertificateTab(),
    PetVaccineHistoryTab(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs_pet.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pet name"),
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            text: "홈",
          ),
          Tab(
            text: "리포트",
          ),
          Tab(
            text: "접종관리",
          ),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
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