import 'package:flutter/material.dart';
import 'package:project_frontend/dataHandler/api_service.dart';
 
class Trip extends StatelessWidget {
  const Trip({
    super.key,
    required this.arrivalTime,
    required this.departureTime,
    required this.trainNo,
    required this.departureCity,
    required this.arrivalCity,
    required this.reserveScreen,
  });
 
  final String departureTime;
  final String arrivalTime;
  final String departureCity;
  final String arrivalCity;
  final int trainNo;
  final Widget reserveScreen;
 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => reserveScreen),
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
                  FutureBuilder<Map<String, dynamic>>(
                    future: ApiService.getPassengerByID("1"), // Replace "1" with actual ID
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading...");
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        final passenger = snapshot.data!;
                        return Text(passenger['Name'] ?? "Unknown Name");
                      } else {
                        return const Text("No data available");
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  Text(
                    departureTime,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(departureCity),
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
                  Text(arrivalCity),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}