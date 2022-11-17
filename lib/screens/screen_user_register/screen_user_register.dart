import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porocci_app/styles/styles.dart';

import '../../enums/enum_auth_status.dart';
import '../../providers/provider_auth.dart';
import './widgets/widgets.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원가입"),
      ),
      body: Center(
        child: Padding(
          padding: AppLayout.formPageContainerPadding,
          child: Column(
            children: const <Widget>[
              RegisterEmailInput(),
              RegisterPasswordInput(),
              RegisterPasswordConfirmInput(),
              RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterEmailInput extends ConsumerWidget {
  const RegisterEmailInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 이게 문제구만...
    final registerFieldNotifier =
        ref.watch(registerFieldNotifierProvider.notifier);
    return TextField(
      onChanged: (email) {
        registerFieldNotifier.setEmail(email);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: '이메일',
        helperText: '',
      ),
    );
  }
}

class RegisterPasswordInput extends ConsumerWidget {
  const RegisterPasswordInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerFieldNotifier =
        ref.watch(registerFieldNotifierProvider.notifier);

    return TextField(
      onChanged: (password) {
        registerFieldNotifier.setPassword(password);
        print("password: $password");
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "비밀번호",
        helperText: "",
      ),
    );
  }
}

class RegisterPasswordConfirmInput extends ConsumerWidget {
  const RegisterPasswordConfirmInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerFieldNotifier =
        ref.watch(registerFieldNotifierProvider.notifier);

    final registerPassword = ref.watch(registerFieldNotifierProvider).password;
    //* 이거 제대로 안들어옴
    final registerPasswordConfirm =
        ref.watch(registerFieldNotifierProvider).passwordConfirm;

    return TextField(
      onChanged: (passwordConfirm) {
        registerFieldNotifier.setPasswordConfirm(passwordConfirm);
      },
      obscureText: true,
      decoration: InputDecoration(
          labelText: "비밀번호 확인",
          helperText: "",
          errorText: registerPassword != registerPasswordConfirm
              ? "비밀번호가 일치하지 않습니다."
              : null),
    );
  }
}

class RegisterButton extends ConsumerWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final registerEmail = ref.watch(registerFieldNotifierProvider).email;
    final registerPassword = ref.watch(registerFieldNotifierProvider).password;
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.width * 0.1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () async {
          await authRepository
              .registerWithEmail(registerEmail, registerPassword)
              .then((registerStatus) {
            if (registerStatus == AuthStatus.registered) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text("회원가입이 완료되었습니다.")));
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                    SnackBar(content: Text("회원가입을 실패했습니다. 다시 시도해주세요.")));
              Navigator.pop(context);
            }
          });
        },
        child: Text('회원가입'),
      ),
    );
  }
}
