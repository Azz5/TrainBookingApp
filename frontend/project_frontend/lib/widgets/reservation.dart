import 'package:flutter/material.dart';
import 'package:project_frontend/screens/user_screens/payment_screen.dart';


class Reservation extends StatefulWidget{
  const Reservation({super.key,required this.data});
  final Map<String,dynamic> data;
  // final String seat;
  // final String paymentStatus;
  // final String month;
  // final String day;
  @override
  State<StatefulWidget> createState() {
    return ReservationState();
  }
}

class ReservationState extends State<Reservation>{
  bool isPaid = false;
  @override
  Widget build(BuildContext context) {
    int id = widget.data["ReservationID"];
    widget.data.remove("ReservationID");
    String payment = widget.data["PaymentStatus"];
    int seat = widget.data["SeatNumber"];
    String date = widget.data["Date"];
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



    return InkWell(
      onTap: (){
       if (payment == "Unpaid"){
          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(id: id,reservationData: widget.data,),));
       }
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
                    Text(day,style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 6,
                      width: 38,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Text(month,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              const SizedBox(width: 50,),
              Column(
                children: [
                  Text("Seat:\n $seat" , style: const TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(width: 50,),
              const Text("Price: \n60SR",style: TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(width: 45,),
              Text("Payment:\n $payment", style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}