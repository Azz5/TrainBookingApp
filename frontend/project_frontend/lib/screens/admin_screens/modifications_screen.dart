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
<<<<<<< HEAD
    List<ReservationAdmin> reservations = [];
    return Center(
      child: 
        ListView(
          children: [
            FutureBuilder<List<dynamic>>(
          future: ApiService.getAllReservations(), 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              final scheduleData = snapshot.data!;
              for (int i = 0; i < scheduleData.length; i++){
                
                reservations.add(ReservationAdmin(data: scheduleData[i],));
              }
              return Column(
                  children: [
        for (int i = 0; i < reservations.length; i++)
          Dismissible(
            key: Key('$i'), 
            onDismissed: (direction) {
              reservations.removeAt(i);
              ApiService.deleteReservation(i.toString());
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            child: reservations[i], 
          ),
          ],
                //reservations,
              );
            } else {
              return const Text("No data available");
            }
          },
        ),
          ],
        ),
=======
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
>>>>>>> ee68c97d4845fa16f21808dba3c23479ae881ccd
    );
  }
}
