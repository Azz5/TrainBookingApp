import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/admin_widgets/reservation_admin.dart';
import 'package:project_frontend/dataHandler/api_service.dart';

class ModificationsScreen extends StatefulWidget {
  const ModificationsScreen({super.key});

  @override
  State<ModificationsScreen> createState() => ModificationsScreenState();
}

class ModificationsScreenState extends State<ModificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifications'),
      ),
      body: Column(
        children: [
          // List of Reservations
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: ApiService.getAllReservations(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  final scheduleData = snapshot.data!;
                  if (scheduleData.isEmpty) {
                    return const Center(child: Text("No reservations available."));
                  }
                  return ListView.builder(
                    itemCount: scheduleData.length,
                    itemBuilder: (context, index) {
                      final reservationData = scheduleData[index];
                      return Dismissible(
                        key: Key(reservationData['ReservationID'].toString()),
                        onDismissed: (direction) async {
                          // Call API to delete reservation
                          await ApiService.deleteReservation(
                              reservationData['ReservationID'].toString());
                          setState(() {
                            scheduleData.removeAt(index);
                          });
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: ReservationAdmin(data: reservationData),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No data available"));
                }
              },
            ),
          ),
          // Add Reservation Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {
                    // Logic for adding a reservation
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
