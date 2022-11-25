import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../styles/styles.dart';
import '../../providers/provider_auth.dart';
import './widgets/widgets.dart';
import "../../enums/enum_auth_state.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: AppLayout.formPageContainerPadding,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              MainLogo(),
              SizedBox(height: 15),
              LoginEmailInput(),
              LoginPasswordInput(),
              SizedBox(height: 15),
              LoginButton(),
              SizedBox(height: 15),
              MoveToRegisterPageButton(),
              SizedBox(height: 60),
              ThirdPartyIconContainer(),
              SizedBox(height: 30),
              //todo 얘 어떻게 밑으로 내리지?
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CopyRightText(
                      copyRightText: "Copyright(c) 가서뭐하지 All Rights Reserved."),
                ),
              )
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

//! user로 들어가는건 알겠는데, user가 수의사인지 아니면 일반사용자인지는 어떻게...?
class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final authState = ref.watch(authStateProvider);
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
            //! 이제 여기를 authStateProvider로 대체해야하는 것이다. 아니면 둘 다 있어야하나...?
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

//! 자동로그인

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
        Navigator.of(context).pushNamed("/user_register");
      },
      child: Text(
        '이메일로 간단하게 회원가입 하기',
        style: TextStyle(color: theme.primaryColor),
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
    return Text(
      copyRightText,
      style: TextStyle(color: Colors.grey),
    );
  }
}
