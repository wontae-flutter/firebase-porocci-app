import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../styles/styles.dart';

class PetVaccineHistoryTab extends ConsumerWidget {
  const PetVaccineHistoryTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        padding: AppLayout.tabContainerPadding,
        child: Column(
          children: [
            Text("예방접종 내역"),
            // DataTable(columns: columns, rows: rows),
          ],
        ),
      ),
    );
  }
}

// ListView(children: [
//                     DataTable(
//                       // dataTextStyle: ,
//                       columns: [
//                         DataColumn(label: Text("이름")),
//                         DataColumn(label: Text("심바")),
//                       ],
//                       rows: List<DataRow>.generate(
//                         petInfos.length,
//                         (index) => DataRow(cells: [
//                           DataCell(
//                             // Text("1"),
//                             Text(petInfos.keys.toList()[index]),
//                           ),
//                           DataCell(
//                             // Text("1"),
//                             Text(petInfos.values.toList()[index]),
//                           ),
//                         ]),
//                       ),

//                       // child: Column(
//                       //   crossAxisAlignment: CrossAxisAlignment.start,
//                       //   children: [
//                       //     Text(petInfos["breed"]),
//                       //     Text(petInfos["name"]),
//                       //     Text(petInfos["sex"]),
//                       //     Text(petInfos["birthdate"]),
//                       //     Text(petInfos["registernumber"]),
//                       //     Text(petInfos["isNeutered"]),
//                       //     Text(petInfos["allergies"]),
//                       //     Text(petInfos["remarks"]),
//                       //   ],
//                       // ),
//                     ),
//                   ]),