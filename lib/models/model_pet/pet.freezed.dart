// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pet _$PetFromJson(Map<String, dynamic> json) {
  return _Pet.fromJson(json);
}

/// @nodoc
mixin _$Pet {
  String get breed => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  String get birthdate => throw _privateConstructorUsedError;
  int get registernumber => throw _privateConstructorUsedError; //* 중성화, 옵셔널
  bool get isNeutered => throw _privateConstructorUsedError;
  List<String> get allergies => throw _privateConstructorUsedError;
  String get remarks => throw _privateConstructorUsedError; //* 알러지
  DocumentReference<Object?>? get reference =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetCopyWith<Pet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetCopyWith<$Res> {
  factory $PetCopyWith(Pet value, $Res Function(Pet) then) =
      _$PetCopyWithImpl<$Res, Pet>;
  @useResult
  $Res call(
      {String breed,
      String image,
      String name,
      String sex,
      String birthdate,
      int registernumber,
      bool isNeutered,
      List<String> allergies,
      String remarks,
      DocumentReference<Object?>? reference});
}

/// @nodoc
class _$PetCopyWithImpl<$Res, $Val extends Pet> implements $PetCopyWith<$Res> {
  _$PetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breed = null,
    Object? image = null,
    Object? name = null,
    Object? sex = null,
    Object? birthdate = null,
    Object? registernumber = null,
    Object? isNeutered = null,
    Object? allergies = null,
    Object? remarks = null,
    Object? reference = freezed,
  }) {
    return _then(_value.copyWith(
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      registernumber: null == registernumber
          ? _value.registernumber
          : registernumber // ignore: cast_nullable_to_non_nullable
              as int,
      isNeutered: null == isNeutered
          ? _value.isNeutered
          : isNeutered // ignore: cast_nullable_to_non_nullable
              as bool,
      allergies: null == allergies
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PetCopyWith<$Res> implements $PetCopyWith<$Res> {
  factory _$$_PetCopyWith(_$_Pet value, $Res Function(_$_Pet) then) =
      __$$_PetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String breed,
      String image,
      String name,
      String sex,
      String birthdate,
      int registernumber,
      bool isNeutered,
      List<String> allergies,
      String remarks,
      DocumentReference<Object?>? reference});
}

/// @nodoc
class __$$_PetCopyWithImpl<$Res> extends _$PetCopyWithImpl<$Res, _$_Pet>
    implements _$$_PetCopyWith<$Res> {
  __$$_PetCopyWithImpl(_$_Pet _value, $Res Function(_$_Pet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breed = null,
    Object? image = null,
    Object? name = null,
    Object? sex = null,
    Object? birthdate = null,
    Object? registernumber = null,
    Object? isNeutered = null,
    Object? allergies = null,
    Object? remarks = null,
    Object? reference = freezed,
  }) {
    return _then(_$_Pet(
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      registernumber: null == registernumber
          ? _value.registernumber
          : registernumber // ignore: cast_nullable_to_non_nullable
              as int,
      isNeutered: null == isNeutered
          ? _value.isNeutered
          : isNeutered // ignore: cast_nullable_to_non_nullable
              as bool,
      allergies: null == allergies
          ? _value._allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(converters: [DocumentReferenceJsonConverter()])
class _$_Pet implements _Pet {
  const _$_Pet(
      {required this.breed,
      required this.image,
      required this.name,
      required this.sex,
      required this.birthdate,
      required this.registernumber,
      this.isNeutered = false,
      final List<String> allergies = const [""],
      this.remarks = "",
      this.reference})
      : _allergies = allergies;

  factory _$_Pet.fromJson(Map<String, dynamic> json) => _$$_PetFromJson(json);

  @override
  final String breed;
  @override
  final String image;
  @override
  final String name;
  @override
  final String sex;
  @override
  final String birthdate;
  @override
  final int registernumber;
//* 중성화, 옵셔널
  @override
  @JsonKey()
  final bool isNeutered;
  final List<String> _allergies;
  @override
  @JsonKey()
  List<String> get allergies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergies);
  }

  @override
  @JsonKey()
  final String remarks;
//* 알러지
  @override
  final DocumentReference<Object?>? reference;

  @override
  String toString() {
    return 'Pet(breed: $breed, image: $image, name: $name, sex: $sex, birthdate: $birthdate, registernumber: $registernumber, isNeutered: $isNeutered, allergies: $allergies, remarks: $remarks, reference: $reference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pet &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.registernumber, registernumber) ||
                other.registernumber == registernumber) &&
            (identical(other.isNeutered, isNeutered) ||
                other.isNeutered == isNeutered) &&
            const DeepCollectionEquality()
                .equals(other._allergies, _allergies) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      breed,
      image,
      name,
      sex,
      birthdate,
      registernumber,
      isNeutered,
      const DeepCollectionEquality().hash(_allergies),
      remarks,
      reference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PetCopyWith<_$_Pet> get copyWith =>
      __$$_PetCopyWithImpl<_$_Pet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PetToJson(
      this,
    );
  }
}

abstract class _Pet implements Pet {
  const factory _Pet(
      {required final String breed,
      required final String image,
      required final String name,
      required final String sex,
      required final String birthdate,
      required final int registernumber,
      final bool isNeutered,
      final List<String> allergies,
      final String remarks,
      final DocumentReference<Object?>? reference}) = _$_Pet;

  factory _Pet.fromJson(Map<String, dynamic> json) = _$_Pet.fromJson;

  @override
  String get breed;
  @override
  String get image;
  @override
  String get name;
  @override
  String get sex;
  @override
  String get birthdate;
  @override
  int get registernumber;
  @override //* 중성화, 옵셔널
  bool get isNeutered;
  @override
  List<String> get allergies;
  @override
  String get remarks;
  @override //* 알러지
  DocumentReference<Object?>? get reference;
  @override
  @JsonKey(ignore: true)
  _$$_PetCopyWith<_$_Pet> get copyWith => throw _privateConstructorUsedError;
}
