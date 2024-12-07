import 'package:flutter/material.dart';
import 'package:project_frontend/screens/user_screens/payment_screen.dart';


class Reservation extends StatefulWidget{
  const Reservation({super.key});
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
        if (!isPaid){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentScreen(),));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Card(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Column(
                  children: [
                    Text("16",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 6,
                      width: 38,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Text("DEC",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              const SizedBox(width: 50,),
              const Column(
                children: [
                  Text("Seat:\n Row 10 Column 2" , style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(width: 66,),
              const Text("Payment:\n Uncompleted", style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}