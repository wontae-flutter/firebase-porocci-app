enum AuthStatus {
  notLoggedIn,
  notRegistered,
  loggedIn,
  registered,
}

// 요거를 전역관리해야하는데.. 
// shared_preference말고.

//! 여기서도 freezed를 쓸 줄이야...
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'auth_state.freezed.dart';

// @freezed
// abstract class AuthState with _$AuthState {
//   const factory AuthState.initializing() = _AuthStateInitializing;
//   const factory AuthState.ready(CountryWithPhoneCode country) = _AuthStateReady;
//   const factory AuthState.error(String errorText) = _AuthStateError;
// }

//* 초기값이 있어야하는데 그러면 모델이어야지 뭐...