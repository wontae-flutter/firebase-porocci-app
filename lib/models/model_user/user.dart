import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user.freezed.dart';
part 'user.g.dart';

class DocumentReferenceJsonConverter
    implements JsonConverter<DocumentReference?, Object?> {
  const DocumentReferenceJsonConverter();

  @override
  DocumentReference? fromJson(Object? json) {
    return tryCast<DocumentReference>(json);
  }

  @override
  Object? toJson(DocumentReference? documentReference) => documentReference;
}

T? tryCast<T>(value) {
  return value == null ? null : value as T;
}

@freezed
class User with _$User {
  @JsonSerializable(converters: [DocumentReferenceJsonConverter()])
  //* 중복확인은 Assert로,
  const factory User({
    required String uid,
    required String name,
    required String email,
    required String nickname,
    required int type,
    DocumentReference? reference,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  //! UID를 snapshot에서 가져올까...?
  factory User.fromSnapshot(DocumentSnapshot document) {
    Map<String, dynamic> map = document.data() as Map<String, dynamic>;
    return User(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      nickname: map['nickname'],
      type: map['type'],
      reference: document.reference,
    );
  }
}
