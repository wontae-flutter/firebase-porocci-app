import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet.g.dart';
part 'pet.freezed.dart';

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
class Pet with _$Pet {
  @JsonSerializable(converters: [DocumentReferenceJsonConverter()])
  const factory Pet({
    required String breed,
    required String image,
    required String name,
    required String sex,
    required String birthdate,
    required int registernumber,
    DocumentReference? reference,
  }) = _Pet;

  //* fromJson, toJson을 동시에
  factory Pet.fromJson(Map<String, Object?> json) => _$PetFromJson(json);

  factory Pet.fromSnapshot(DocumentSnapshot document) {
    Map<String, dynamic> map = document.data() as Map<String, dynamic>;
    return Pet(
      breed: map['breed'],
      image: map['image'],
      name: map['name'],
      sex: map['sex'],
      birthdate: map['birthdate'],
      registernumber: map['registernumber'],
      reference: document.reference,
    );
  }
}
