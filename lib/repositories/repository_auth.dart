import 'package:firebase_core/firebase_core.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../enums/enum_auth_status.dart';

class AuthRepository {
  final Ref ref;

  //* authClient: Firebase와 연결된 인스턴스를 저장할 변수
  //* provider을 사용하면 앱 전역에 같은 authClient를 유지, 제공할 수 있다.
  FirebaseAuth authClient;
  User? user;

  AuthRepository({
    auth,
    required this.ref,
  }) : authClient = auth ?? FirebaseAuth.instance;

  //! 안되는데 왜 안되지.
  // Stream<User?> getUserAuthState() async* {
  //   yield authClient.authStateChanges().listen((User? user) => user);
  // }

  Future<AuthStatus> registerWithEmail(String email, String password) async {
    try {
      UserCredential credential = await authClient
          .createUserWithEmailAndPassword(email: email, password: password);
      //* 회원가입하고 따로 받아오는게 없습니다.
      return AuthStatus.registered;
    } catch (e) {
      print(e);
      return AuthStatus.notRegistered;
    }
  }

  Future<AuthStatus> loginWithEmail(String email, String password) async {
    try {
      await authClient
          .signInWithEmailAndPassword(email: email, password: password)
          //* 인증정보를 담고있는 객체
          .then((credential) async {
        user = credential.user;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogin', true);
        prefs.setString('email', email);
        //! 비밀번호 hash하는 패키지를 당연히 사용해야 합니다
        prefs.setString('password', password);
      });
      print("[+] 로그인유저 : " + user!.email.toString());
      return AuthStatus.loggedIn;
    } catch (e) {
      print(e);
      return AuthStatus.notLoggedIn;
    }
  }

  //! 여기서부터 써드파티!
  //todo Federated Identity & Social
  //* Google Authentication
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await authClient.signInWithCredential(credential);
  }

  //* Apple Authentication
  //* 네이버 카카오 도전? ㅋㅋㅋㅋㅋ

  //* 로그아웃 = 간단하게 모든 정보를 삭제하면 됩니다
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //! 여기서 isAutoLogin은 건들면 안되지!!! ㅋㅋㅋ
    //! 체크박스에서 제대로 안되고 있는거야
    prefs.setBool("isLogin", false);
    prefs.setString("email", "");
    prefs.setString("password", "");
    user = null;
    await authClient.signOut();
    print("로그아웃 되었습니다.");
  }
}
