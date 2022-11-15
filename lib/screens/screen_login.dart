import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "../enums/enum_auth_status.dart";
import '../providers/provider_auth.dart';
import '../providers/provider_shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("로그인"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 5, 40, 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              LoginEmailInput(),
              LoginPasswordInput(),
              // AutoLoginBox(),
              LoginButton(),
              MoveToRegisterPageButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// 지금 밑에게 매우 안되는 중
class LoginEmailInput extends ConsumerWidget {
  const LoginEmailInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 이게 문제구만...
    final loginFieldNotifier = ref.watch(loginFieldNotifierProvider.notifier);
    return TextField(
      onChanged: (email) {
        loginFieldNotifier.setEmail(email);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: '이메일',
        helperText: '',
      ),
    );
  }
}

class LoginPasswordInput extends ConsumerWidget {
  const LoginPasswordInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFieldNotifier = ref.watch(loginFieldNotifierProvider.notifier);

    return TextField(
      onChanged: (password) {
        loginFieldNotifier.setPassword(password);
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "비밀번호",
        helperText: "",
      ),
    );
  }
}

//! sharedProvider는 전역에 하나만 생성되니까 provider를 쓰는게 아니다
//! stf의 initstate에서 어떻게 불러와서 쓸 것인지가 중요하지...
// 삽질하고 있었다

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final loginEmail = ref.watch(loginFieldNotifierProvider).email;
    final loginPassword = ref.watch(loginFieldNotifierProvider).password;

    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.05,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: const Text("로그인"),
          onPressed: () {
            authRepository.loginWithEmail(loginEmail, loginPassword).then(
              (loginStatus) async {
                if (loginStatus == AuthStatus.loggedIn) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      content: Text("로그인 성공"),
                    ));

                  //! isLogin로직 잘 되는지 보려고 해봄
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/home", (route) => false);
                } else {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      content: Text("로그인 실패"),
                    ));
                }
              },
            );
          },
        ));
  }
}

//! 아이디찾기

//! 비밀번호재설정

//! 회원가입
class MoveToRegisterPageButton extends StatelessWidget {
  const MoveToRegisterPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed("/register");
      },
      child: Text(
        '이메일로 간단하게 회원가입 하기',
        style: TextStyle(color: theme.primaryColor),
      ),
    );
  }
}

//! 써드파티로그인
//* 애플
//* 카카오
//* 구글

class ThirdPartyIcons extends StatelessWidget {
  final String imagePath;
  const ThirdPartyIcons({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [],
    );
  }

  Widget _thirdPartyIcon(imagePath) {
    return SizedBox(
      width: 100,
      height: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}

class CopyRightText extends StatelessWidget {
  final String copyRightText;
  const CopyRightText({
    super.key,
    required this.copyRightText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(copyRightText);
  }
}
