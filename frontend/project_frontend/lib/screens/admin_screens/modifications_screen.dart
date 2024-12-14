import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/admin_widgets/reservation_admin.dart';
import 'package:project_frontend/dataHandler/api_service.dart';

class ModificationsScreen extends StatefulWidget{
  const ModificationsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return ModificationsScreenState();
  }
}

class ModificationsScreenState extends State<ModificationsScreen>{
  @override
  Widget build(BuildContext context) {
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
    );
  }
}