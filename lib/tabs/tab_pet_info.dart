import 'package:flutter/material.dart';

import '../styles/styles.dart';

var petInfos = {
  "breed": "요크셔테리아",
  "image":
      "https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg",
  "name": "심바",
  "sex": "여",
  "birthdate": "2022-06-01",
  "registernumber": "410-11111111",
  "isNeutered": "안함",
  "allergies": ["닭", "견과류"],
  "remarks": "귀여움"
};

class PetInfoTab extends StatelessWidget {
  const PetInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: Container(
            padding: AppLayout.tabContainerPadding,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: AppBorder.onlyTopCircularBorder,
                  child: Image.network(
                    "https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg",
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
                //! 일단 여기서 UI만 잡기로 했자나 그지?
                Card()
              ],
            )),
      ),
    );
  }
}
