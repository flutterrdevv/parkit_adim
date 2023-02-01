import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/constant.dart';
import '../../../../widgets/custom_round_button.dart';
import '../../../../widgets/custom_text.dart';

class ResevationCard extends StatelessWidget {
  const ResevationCard({super.key, required this.data});
  final QueryDocumentSnapshot<Object?> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data['place']} Parking',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  '${data['place']},${data['city']}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: yellow,
                    ),
                    Icon(
                      Icons.star_border,
                      color: yellow,
                    ),
                    Icon(
                      Icons.star_border,
                      color: yellow,
                    ),
                    Text(
                      ' 3.0',
                      style: TextStyle(color: yellow, fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: teal.withOpacity(0.2)),
                      child: Icon(
                        Icons.pin_drop_rounded,
                        color: teal,
                        size: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('150m away')
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: teal.withOpacity(0.2)),
                      child: Icon(
                        Icons.alarm,
                        color: teal,
                        size: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('15 min')
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: teal.withOpacity(0.2)),
                      child: Icon(
                        Icons.local_parking,
                        color: teal,
                        size: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('20 spot')
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CRoundButton(
                  function: () {},
                  text: 'Call',
                  color: red,
                ),
                CRoundButton(
                  function: () {},
                  text: 'Direction',
                  color: red,
                )
              ],
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Slot number: ${data['slotNumber']}",
                    color: white,
                    size: 16,
                  ),
                  CustomText(
                    text: "Vehicle plate number: ${data['plateNumber']}",
                    color: white,
                    size: 16,
                  ),
                  CustomText(
                    text:
                        "Reservation time: ${(DateTime.parse(data['reservationTime'].toDate().toString())).toString()}",
                    color: white,
                    size: 16,
                  ),
                  CustomText(
                    text:
                        "End Time:  ${(DateTime.parse(data['reservationEndTime'].toDate().toString())).toString()}",
                    color: white,
                    size: 16,
                  ),
                  CustomText(
                    text: "Duration: ${data['hours']}",
                    color: white,
                    size: 16,
                  ),
                  CustomText(
                    text: "Vehicle type: ${data['vehicle']}",
                    color: white,
                    size: 16,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CRoundButton(
                width: 300,
                function: () {},
                text: 'Reserved',
                color: grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
