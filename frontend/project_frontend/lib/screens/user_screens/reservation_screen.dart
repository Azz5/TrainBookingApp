import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/reservation.dart';


class ReservationScreen  extends StatelessWidget{
  const ReservationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Reservation> reservations = const [Reservation(),Reservation(),Reservation(),];
    return Center(
      child: Column(
        children: [
          ...reservations,
        ],
      ));
  }
}