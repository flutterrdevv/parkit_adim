// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckReservationScreen extends StatefulWidget {
  const CheckReservationScreen({super.key});

  @override
  State<CheckReservationScreen> createState() => _CheckReservationScreenState();
}

class _CheckReservationScreenState extends State<CheckReservationScreen> {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  @override
  void initState() {
    checkReservation();
    super.initState();
  }

  checkReservation() {
    try {
      instance
          .collection('reservations')
          .where('plateNumber', isEqualTo: 'aRB140'.toLowerCase())
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          for (var element in value.docs) {
            print('firebase data------------------');
            print(element.data());
          }
        } else {
          print('sorry no any Firebase data');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [Container()],
        ),
      )),
    );
  }
}
