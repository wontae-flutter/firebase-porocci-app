import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "../providers/provider_auth.dart";

//! 일단은 로그아웃 기능만!
class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SizedBox.expand(
      child: Container(
        child: Column(
          children: [
            Text("Profile"),
            TextButton(
              onPressed: () {
                authRepository
                    .logout()
                    .then((_) => ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text("로그아웃 되었습니다."))));
                Navigator.of(context).pushReplacementNamed("/login");
              },
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
