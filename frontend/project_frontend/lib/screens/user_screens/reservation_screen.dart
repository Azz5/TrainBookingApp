import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/reservation.dart';
import 'package:project_frontend/dataHandler/api_service.dart';


class ReservationScreen  extends StatelessWidget{
  const ReservationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Reservation> reservations = []; //const [Reservation(),Reservation(),Reservation(),];
    return Center(
      child: Column(
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
            String payment = scheduleData[i]["PaymentStatus"];
            String date = scheduleData[i]["Date"];
            String seat = scheduleData[i]["SeatNumber"];
            String month = date.substring(5,7);
            String day = date.substring(8,10);
            switch(month){
              case "01" :
              month = "JAN";
              break;
              case "02" :
              month = "FEB";
              break;
              case "03" :
              month = "MAR";
              break;
              case "04" :
              month = "APR";
              break;
              case "05" :
              month = "MAY";
              break;
              case "06" :
              month = "JUN";
              break;
              case "07" :
              month = "JUL";
              break;
              case "08" :
              month = "AUG";
              break;
              case "09" :
              month = "SEP";
              break;
              case "10" :
              month = "OCT";
              break;
              case "11" :
              month = "NOV";
              break;
              case "12" :
              month = "DEC";
              break;
            }
            reservations.add(Reservation(seat: seat, paymentStatus: payment, day: day, month: month));
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