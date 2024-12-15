import 'package:flutter/material.dart';
import 'dart:math';

 
class Trip extends StatelessWidget {
  const Trip({
    super.key,
    required this.arrivalTime,
    required this.departureTime,
    required this.trainNo,
    required this.departureCity,
    required this.arrivalCity,
    required this.seatScreen,

  });
 
  final String departureTime;
  final String arrivalTime;
  final String departureCity;
  final String arrivalCity;
  final String trainNo;
  final Widget seatScreen;
  //   String scheduleId;
  // String departureTime;
  // String arrivalTime;
  // String departureCity;
  // String arrivalCity;
  // String trainId;
  // String date;

 
  @override
  Widget build(BuildContext context) {
      Map<int,String> cities = {
    1 : "Riyadh",
    2 : "Dammam",
    3 : "Jeddah",
    4 : "Abhah"
  };
  Random random = Random();
  int randomNumber = random.nextInt(4) + 1;
  int randomNumber2 = random.nextInt(4) + 1;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => seatScreen),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Card(
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    trainNo.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  const Text("Trip ID"),
                  // FutureBuilder<Map<String, dynamic>>(
                  //   future: ApiService.getPassengerByID("1"), // Replace "1" with actual ID
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return const Text("Loading...");
                  //     } else if (snapshot.hasError) {
                  //       return Text("Error: ${snapshot.error}");
                  //     } else if (snapshot.hasData) {
                  //       final passenger = snapshot.data!;
                  //       return Text(passenger['Name'] ?? "Unknown Name");
                  //     } else {
                  //       return const Text("No data available");
                  //     }
                  //   },
                  // ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  Text(
                    departureTime,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(cities[randomNumber]!),
                ],
              ),
              const SizedBox(width: 15),
              const Column(
                children: [
                  Text(
                    ".........",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Text(
                    arrivalTime,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(cities[randomNumber2]!)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}