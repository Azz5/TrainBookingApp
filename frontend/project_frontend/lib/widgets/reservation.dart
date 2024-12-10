import 'package:flutter/material.dart';
import 'package:project_frontend/screens/user_screens/payment_screen.dart';


class Reservation extends StatefulWidget{
  const Reservation({super.key, required this.seat, required this.paymentStatus, required this.day, required this.month});
  final String seat;
  final String paymentStatus;
  final String month;
  final String day;
  @override
  State<StatefulWidget> createState() {
    return ReservationState();
  }
}

class ReservationState extends State<Reservation>{
  bool isPaid = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       // if (!isPaid){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentScreen(),));
        //}
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Card(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Text(widget.day,style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 6,
                      width: 38,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Text(widget.month,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              const SizedBox(width: 50,),
              Column(
                children: [
                  Text("Seat:\n ${widget.seat}" , style: const TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(width: 66,),
              Text("Payment:\n ${widget.paymentStatus}", style: const TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}