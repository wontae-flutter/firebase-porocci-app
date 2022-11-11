import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
// import "package:flutter_riverpod/flutter_riverpod.dart";

import '../models/model_pet/pet.dart';

class PetRepository {
  late CollectionReference petsReference; //* collection에 접근하기 위해 만든 객체
  late Stream<QuerySnapshot> petsStream; //* stream of pets

  Future initDb() async {
    petsReference = FirebaseFirestore.instance.collection("pets");
    petsStream = petsReference.snapshots(); //* snapshot, of stream
  }

  //! 요 함수들을 직접 form에서 관리하게 될 거야.
  Future addPet(Pet pet) async {
    petsReference.add(pet.toJson());
  }

  Future updatePet(Pet pet) async {
    pet.reference?.update(pet.toJson());
  }

  Future deletePet(Pet pet) async {
    pet.reference?.delete();
  }
}
