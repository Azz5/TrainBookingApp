import 'package:flutter/material.dart';


class Ticket extends StatelessWidget{
  const Ticket({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30,left: 10,right: 10,top: 20),
      height: 600,
      width: 400,
      child: const Card(
        color: Color.fromARGB(223, 255, 255, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),

        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15,left: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Name: Rakan Alsaeed",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 90,),
                      Text("Seat: 2A",style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("Passenger ID: 2",style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 134,),
                      Text("Reservation ID: 4",style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
            Center(child: Icon(Icons.qr_code_2,size: 300,),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Trip:",style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 10,),
                Text("Dammam"),
                SizedBox(width: 10,),
                Icon(Icons.arrow_right_alt),
                SizedBox(width: 10,),
                Text("Riyadh")
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Text("Departure Time: 11:00am",style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Arrival Time: 12:30pm",style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 20,),
                Text("Stop Sequences: 2",style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 35,),
            Row(children: [
              SizedBox(width: 30,),
              Text(
                "Kingdom Express"
              ),
              Spacer(),
              Text("قطار المملكة"),
              SizedBox(width: 30,)
            ],)
          ],
        ),
      ),
    );
  }
}