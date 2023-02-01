// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:park_admin/screens/reservation/reservation_crad_screen.dart';
import '../../helpers/constant.dart';
import '../../helpers/screen_navigation.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: red,
        backgroundColor: red,
        title: const Text('Reservations'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('reservations')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                print('---- not data error');
                print(snapshot.error);
                return const Center(child: Text('No data'));
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
                print(item);
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = item[index];
                      return GestureDetector(
                        onTap: () {
                          changeScreen(context, ResevationCard(data: data));
                        },
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            subtitle: Text(DateTime.parse(
                                    data['reservationTime'].toDate().toString())
                                .toString()),
                            leading: const Icon(Icons.pedal_bike_outlined),
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
    );
  }
}
