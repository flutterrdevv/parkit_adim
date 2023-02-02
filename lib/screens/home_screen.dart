import 'package:flutter/material.dart';
import 'package:park_admin/screens/bluetooth/bluetooth_screen.dart';
import 'package:park_admin/screens/reservation/check_reservation_screen.dart';
import 'package:park_admin/screens/reservation/reservation_screen.dart';
import '../helpers/screen_navigation.dart';
import '../widgets/text_recognition_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Park_it Admin'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () =>
                      changeScreen(context, const ReservationScreen()),
                  child: const Text('Reservations')),
              ElevatedButton(
                  onPressed: () =>
                      changeScreen(context, const FlutterBlueApp()),
                  child: const Text('Bluetooth')),
              const SizedBox(height: 25),
              const TextRecognitionWidget(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      );
}
