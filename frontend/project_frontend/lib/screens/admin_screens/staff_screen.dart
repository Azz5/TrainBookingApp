import 'package:flutter/material.dart';
import 'package:project_frontend/dataHandler/api_service.dart';
import 'package:project_frontend/widgets/admin_widgets/staff_card.dart';


class StaffScreen extends StatefulWidget{
  const StaffScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return StaffScreenState();
  }
}


class StaffScreenState extends State<StaffScreen>{
    List<StaffCard> staff = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder(
          future: ApiService.getAllStaff(), 
          builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          final scheduleData = snapshot.data!;
          for (int i = 0; i < scheduleData.length; i++){
            
            staff.add(StaffCard(name: scheduleData[i]["name"], staffID: scheduleData[i]["staffID"], assignedTrainID: scheduleData[i]["assignedTrainID"] ?? null,role: scheduleData[i]["role"],));
            // trains.add(TrainAdmin(trainID: scheduleData[i]["TrainID"], originStationID: scheduleData[i]["OriginStationID"], destinationStationID: scheduleData[i]["DestinationStationID"]));
          }
          return Column(
            children: [
              ...staff,
            ]
          );
        } else {
          return const Text("No data available");
        }
      },
          ),
      ],
    );
  }
}