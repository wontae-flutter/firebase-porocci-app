import "package:shared_preferences/shared_preferences.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharedPrefRepository {
  final Ref ref;

  //* authClient: Firebase와 연결된 인스턴스를 저장할 변수
  //* provider을 사용하면 앱 전역에 같은 authClient를 유지, 제공할 수 있다.

  SharedPrefRepository({
    required this.ref,
  });

  //! 밑에 await를 쓰지 않아도 되면 퍼펙트한데...
  Future<bool> getIsAutoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 여기에 만들어봅시다.
    //? 어짜피 prefs는 자체가 전역이야...
    bool isAutoLogin = prefs.getBool("isAutoLogin")!;
    return isAutoLogin;
  }

  Future<void> setIsAutoLogin(bool isAutologin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 여기에 만들어봅시다.
    //? 어짜피 prefs는 자체가 전역이야...
    prefs.setBool("isAutoLogin", isAutologin);
  }
}
