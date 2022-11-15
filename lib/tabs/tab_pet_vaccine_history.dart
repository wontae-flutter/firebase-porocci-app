import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//! 일단은 로그아웃 기능만!
class PetVaccineHistoryTab extends ConsumerWidget {
  const PetVaccineHistoryTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.expand(
      child: Container(
        child: Column(
          children: [
            Text("Profile"),
          ],
        ),
      ),
    );
  }
}
