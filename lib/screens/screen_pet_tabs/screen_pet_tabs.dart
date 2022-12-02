import 'package:flutter/material.dart';
import 'tabs/tabs_pet.dart';

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
        shape: Border(bottom: BorderSide(color: Colors.black26)),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0,
        title: Text("펫 프로필"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.black26,
              ),
              TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "홈",
                  ),
                  Tab(
                    text: "리포트",
                  ),
                  Tab(
                    text: "접종 관리",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs_pet,
      ),
    );
  }
}
