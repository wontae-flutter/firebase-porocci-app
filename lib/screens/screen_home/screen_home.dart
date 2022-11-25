import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums/enum_auth_state.dart';
import '../../providers/provider_auth.dart';
import '../../styles/styles.dart';
import './widgets/widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authRepository = ref.watch(authRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(IconData(0xf237, fontFamily: 'MaterialIcons'))),
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed("/login"),
              icon: Icon(IconData(0xe3b2, fontFamily: 'MaterialIcons'))),
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(Icons.settings),
              );
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          padding: AppLayout.endDrawbarPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/mypage");
                  },
                  child: Text("마이페이지")),
              LogoutButton(),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true, //* body위에 appbar
      body: Container(
        color: AppColor.homeScreenBackgroundColor,
        child: Column(
          children: [
            HeroImageSection(),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, -30),
                child: HomeArea(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);

    return TextButton(
      onPressed: () {
        authRepository.logout().then((_) => ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text("로그아웃 되었습니다."))));
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/home", (route) => false);
      },
      child: Text("Logout"),
    );
  }
}
