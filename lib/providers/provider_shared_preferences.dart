import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/repository_shared_preferences.dart';
// final sharedPrefProvider = FutureProvider((ref) async {
//   final sharedPref = await SharedPreferences.getInstance();
//   return sharedPref;
// });

// final isLoginProvider = StateProvider<bool>((ref) {
//   final sharedPref = ref.watch(sharedPrefProvider).value;
//   final isLogin = sharedPref!.getBool("isLogin");
//   //* 처음 몇초동안만 false로 되어있는건데...
//   return isLogin ?? false;
// });

//* 아 이게 아니라
//* isLogin이라는 변수를 먼저 만들고 나중에 sharePref에 저장을 해야되나보다...
// 그러면 isLogin은 쉽게 할 수 있자나!

final sharedPrefRepositoryProvider =
    Provider((ref) => SharedPrefRepository(ref: ref));
//* 기본값
final isAutoLoginProvider = StateProvider<bool>((ref) => false);
