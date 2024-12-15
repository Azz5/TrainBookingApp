import 'package:flutter/material.dart';
import 'package:project_frontend/screens/admin_screens/waitlist_screen.dart';

class TrainWaitlist extends StatelessWidget{
  const TrainWaitlist({super.key, required this.name, required this.trainID, required this.date});
  final String name;
  final String trainID;
  final String date;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => WaitlistScreen(trainID: trainID),));
      },
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.train, color: Color.fromARGB(255, 57, 39, 176),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text("ID: $trainID"),
                Text(date),
            
              ],
            ),
          ],
        ),
      ),
    );
  }
}