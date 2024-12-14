import 'package:flutter/material.dart';


class ReservationAdmin extends StatefulWidget{
  const ReservationAdmin({super.key,required this.data});
  final Map<String,dynamic> data;
  @override
  State<StatefulWidget> createState() {
    return ReservationState();
  }
}

class ReservationState extends State<ReservationAdmin>{
  @override
  Widget build(BuildContext context) {
    int reservationID = widget.data["ReservationID"];
    String trainID = widget.data["TrainID"];
    int passengerID = widget.data["PassengerID"];
    String paymentStatus = widget.data["PaymentStatus"];
    int seat = widget.data["SeatNumber"];
    String date = widget.data["Date"].substring(0,10);
    return InkWell(
      onTap: (){

       
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 110,
        width: 500,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Train ID: $trainID"),
                    Text("Passenger ID: $passengerID"),
                    Text("Reservation ID: $reservationID"),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date: $date"),
                    Text("Seat No: $seat"),
                    Text("Payment Status: $paymentStatus")
                  ],
                ),
                const SizedBox(width: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}