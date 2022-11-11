// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pet _$$_PetFromJson(Map<String, dynamic> json) => _$_Pet(
      breed: json['breed'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      sex: json['sex'] as String,
      birthdate: json['birthdate'] as String,
      registernumber: json['registernumber'] as int,
      reference:
          const DocumentReferenceJsonConverter().fromJson(json['reference']),
    );

Map<String, dynamic> _$$_PetToJson(_$_Pet instance) => <String, dynamic>{
      'breed': instance.breed,
      'image': instance.image,
      'name': instance.name,
      'sex': instance.sex,
      'birthdate': instance.birthdate,
      'registernumber': instance.registernumber,
      'reference':
          const DocumentReferenceJsonConverter().toJson(instance.reference),
    };
