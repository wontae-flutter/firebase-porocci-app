import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initializing() = _AuthStateInitializing;
}

//* Auth도 상태가 변해야하니까 모델이어야하잖아요? enum으로 하면 안된다 이겁니다...