import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porocci_app/tabs/tabs.dart';
import '../providers/provider_shared_preferences.dart';

class IndexScreen extends ConsumerStatefulWidget {
  const IndexScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IndexScreenState();
}

class _IndexScreenState extends ConsumerState<IndexScreen> {
  int _currentTabIndex = 0;
  final List<Widget> _tabs = [
    HomeTab(),
    PetProfile(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    final sharedPrefRepository = ref.watch(sharedPrefRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Porocci App"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentTabIndex,
        selectedLabelStyle: TextStyle(fontSize: 12),
        onTap: (index) async {
          print(await sharedPrefRepository.getIsAutoLogin());
          setState(() {
            _currentTabIndex = index;
            print(_currentTabIndex);
            //* 지금은 서치탭이 없죠!
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(IconData(0xe4a1, fontFamily: 'MaterialIcons')),
              label: '마이펫'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
        ],
      ),
      body: _tabs[_currentTabIndex],
    );
  }
}
