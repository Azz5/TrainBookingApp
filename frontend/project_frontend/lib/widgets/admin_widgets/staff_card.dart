import 'package:flutter/material.dart';

class StaffCard extends StatelessWidget{
  const StaffCard({super.key, required this.name, required this.staffID, required this.assignedTrainID, required this.role});
  final String name;
  final int staffID;
  final String? assignedTrainID;
  final String role;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 130,
          width: 500,
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
                          Text("Name: $name"),
                          const Spacer(),
                          Text("Staff ID: $staffID"),
                          const SizedBox(width: 37,),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          assignedTrainID != null ? Text("Assigned Train ID: $assignedTrainID") : const Text(""),
                          const Spacer(),
                          Text("Role: $role"),
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
      ),
    );
  }
}