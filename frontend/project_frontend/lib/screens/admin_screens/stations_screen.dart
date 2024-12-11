import 'package:flutter/material.dart';
import 'package:project_frontend/dataHandler/api_service.dart';
import 'package:project_frontend/widgets/admin_widgets/train_admin.dart';


class StationsScreen extends StatefulWidget{
  const StationsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return StationsScreenState();
  }
}

class StationsScreenState extends State<StationsScreen>{
  List<TrainAdmin> trains = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder<List<dynamic>>(
      future: ApiService.getAllTrains(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          final scheduleData = snapshot.data!;
          for (int i = 0; i < scheduleData.length; i++){
            trains.add(TrainAdmin(trainsMap: scheduleData[i]));
            // trains.add(TrainAdmin(trainID: scheduleData[i]["TrainID"], originStationID: scheduleData[i]["OriginStationID"], destinationStationID: scheduleData[i]["DestinationStationID"]));
          }
          return Column(
            children: [
              ...trains,
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