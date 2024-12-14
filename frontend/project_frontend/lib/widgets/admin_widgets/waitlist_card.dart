import 'package:flutter/material.dart';
import 'package:project_frontend/screens/admin_screens/trains_screen_admin.dart';
import 'package:project_frontend/dataHandler/api_service.dart';

class WaitlistCard extends StatelessWidget{
  const WaitlistCard({super.key,required this.passengerID, required this.classism, required this.priority, required this.waitlistID});
  final int passengerID;
  final String classism;
  final String priority;
  final int waitlistID;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 130,
        width: 400,
        padding: const EdgeInsets.only(top: 20),
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.person,size: 50,color: Color.fromARGB(172, 114, 126, 126),),
              const VerticalDivider(
                width: 30,
                thickness: 0.4,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Passenger ID: $passengerID"),
                        const Spacer(),
                        Text("Role: $priority"),
                        const SizedBox(width: 37,),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("class: $classism"),
                        const Spacer(),
                        TextButton(onPressed: ()async {
                          await ApiService.promoteWaitlistEntry(waitlistID);
                        }, child: const Text("Promote")),
                        const SizedBox(width: 7,),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}