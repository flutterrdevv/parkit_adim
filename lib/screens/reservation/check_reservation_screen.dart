// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:park_admin/screens/reservation/reservation_crad_screen.dart';

import '../../helpers/constant.dart';
import '../../helpers/screen_navigation.dart';

class CheckReservationScreen extends StatefulWidget {
  final String plateNumber;
  const CheckReservationScreen({super.key, required this.plateNumber});

  @override
  State<CheckReservationScreen> createState() => _CheckReservationScreenState();
}

class _CheckReservationScreenState extends State<CheckReservationScreen> {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  @override
  void initState() {
    // checkReservation();
    print(widget.plateNumber);
    super.initState();
  }

  // checkReservation() {
  //   try {
  //     instance
  //         .collection('reservations')
  //         .where('plateNumber', isEqualTo: widget.plateNumber.toLowerCase())
  //         .get()
  //         .then((value) {
  //       if (value.docs.isNotEmpty) {
  //         for (var element in value.docs) {
  //           print('firebase data------------------');
  //           print(element.data());
  //         }
  //       } else {
  //         print('sorry no any Firebase data');
  //       }
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checking Resevations')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                'Your Plate number is:  ${widget.plateNumber}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('reservations')
                      .where('plateNumber',
                          isEqualTo: widget.plateNumber.trim())
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print('---- not data error');
                      print(snapshot.error);
                      return const Center(child: Text('No Reservations'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print('---- connection state error');
                      print(snapshot.error);
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    } else {
                      print(
                          '----------------------Stream data is here----------------------');
                      var item = snapshot.data!.docs;

                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = item[index];
                            print(data.data());
                            DateTime startTime = DateTime.parse(
                                data['reservationTime'].toDate().toString());
                            DateTime endTime = DateTime.parse(
                                data['reservationEndTime'].toDate().toString());
                            DateTime currentTime = DateTime.now();
                            return GestureDetector(
                              onTap: () {
                                changeScreen(
                                    context,
                                    ResevationCard(
                                      data: data,
                                    ));
                              },
                              child: Card(
                                color: currentTime.isAfter(startTime) &&
                                            currentTime.isBefore(endTime) ||
                                        currentTime
                                            .isAtSameMomentAs(startTime) ||
                                        currentTime.isAtSameMomentAs(endTime)
                                    ? Colors.green
                                    : null,
                                elevation: 3,
                                child: ListTile(
                                  subtitle: Text(DateTime.parse(
                                          data['reservationTime']
                                              .toDate()
                                              .toString())
                                      .toString()),
                                  leading:
                                      const Icon(Icons.pedal_bike_outlined),
                                  trailing: Text(
                                    data['price'].toString(),
                                    style: TextStyle(
                                        color: teal,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  title: Text(data['place']),
                                ),
                              ),
                            );
                          });
                    }
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
