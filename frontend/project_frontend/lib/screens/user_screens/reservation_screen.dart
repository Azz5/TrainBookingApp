import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/reservation.dart';
import 'package:project_frontend/dataHandler/api_service.dart';
import 'package:project_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';


class ReservationScreen  extends StatelessWidget{
  const ReservationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Reservation> reservations = []; //const [Reservation(),Reservation(),Reservation(),];
    String email = context.read<LoginProvider>().email;
    return Center(
      child: ListView(
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
           if (scheduleData[i]["Email"] == email){
            reservations.add(Reservation(data: scheduleData[i],));
           }
          }
          return Column(
            children: reservations,
          );
        } else {
          return const Text("No data available");
        }
      },
    ),
        ],
      ));
  }
}