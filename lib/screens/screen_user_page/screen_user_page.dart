import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/provider_auth.dart';

import './widgets/widgets.dart';

class UserPageScreen extends ConsumerWidget {
  const UserPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("마이페이지"),
        //todo actions를 만들고 새로운 등록페이지를 만들수도 있는데, 그렇게 하지 않습니다.
        //todo 이 페이지 내부에 버튼을 만들거나 이 페이지 자체가 등록페이지 될 수도 있죠. 앱이 크지 않으니까
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              authRepository.logout().then((_) => ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text("로그아웃 되었습니다."))));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/home", (route) => false);
            },
            child: Text("Logout"),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

//! 나갈때 pushReplacementNamed를 해줘서 그래요.