import 'package:flutter/material.dart';
import 'package:project_frontend/dataHandler/api_service.dart';

class TrainAdmin extends StatefulWidget{
  const TrainAdmin({super.key, required this.trainsMap});
  final Map<String,dynamic> trainsMap;
  // final String trainID;
  // final int originStationID;
  // final int destinationStationID;
  @override
  State<StatefulWidget> createState() {
    return TrainAdminState();
  }
}

class TrainAdminState extends State<TrainAdmin>{
  List<Map<String,dynamic>> stations = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: FutureBuilder<List<dynamic>>(
      future: ApiService.getAllStations(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          final scheduleData = snapshot.data!;
          for (int i = 0; i < scheduleData.length; i++){
            if (scheduleData[i]["StationID"] == widget.trainsMap["OriginStationID"] || scheduleData[i]["StationID"] == widget.trainsMap["DestinationStationID"]){
              stations.add(scheduleData[i]);
            }
          
          }
          return Padding(
            padding: const EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 15),
            child: Column(
              children: [
                Text("Train ID: ${widget.trainsMap["TrainID"]}"),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    Text("${widget.trainsMap["TrainName_EN"]}"),
                    const Spacer(),
                    Text("${widget.trainsMap["TrainName_AR"]}"),
                  ],
                ),
                const Icon(Icons.train_rounded,color: Color.fromARGB(255, 34, 9, 73),size: 100,),
                const SizedBox(height: 15,),
                Text("Date: ${widget.trainsMap["ScheduleDate"].substring(0,10)}"),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Origin Station"),
                        const SizedBox(height: 15,),
                        Text("ID: ${stations[0]["StationID"]}"),
                        Text("Name: ${stations[0]["StationName"]}"),
                        Text("Location: ${stations[0]["Location"]}"),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Destination Station"),
                        const SizedBox(height: 15,),
                        Text("ID: ${stations[1]["StationID"]}"),
                        Text("Name: ${stations[1]["StationName"]}"),
                        Text("Location: ${stations[1]["Location"]}"),
                
                      ],
                    ),
                  ],
                ),
              ],
            ),
         
         
            // child: Column(
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text("Train ID: ${widget.trainsMap["TrainID"]}"),
            //       ],
            //     ),
            //     const SizedBox(height: 20,),
            //     Row(children: [
            //       Text("${widget.trainsMap["TrainName_EN"]}"),
            //       const Spacer(),
            //       Text("${widget.trainsMap["TrainName_AR"]}"),
            //     ],),
            //     const Icon(Icons.train_rounded,color: Color.fromARGB(255, 34, 9, 73),size: 100,),
            //     const SizedBox(height: 15,),
            //     Text("Date: ${widget.trainsMap["ScheduleDate"].substring(0,10)}"),
            //     const SizedBox(height: 15,),
            //     const Row(
            //       children: [
            //         Text("Origin Station"),
            //         SizedBox(width: 131,),
            //         Text("Destination Station")
            //       ],
            //     ),
            //     const SizedBox(height: 10,),
            //     Row( children: [
            //     Text("ID: ${stations[0]["StationID"]}"),
            //     const SizedBox(width: 195,),
            //     Text("ID: ${stations[1]["StationID"]}"),
            //     ],
            //     ),
            //     Row(
            //       children: [
            //         Text("Name: ${stations[0]["StationName"]}"),
            //         const Spacer(),
            //         Text("Name: ${stations[1]["StationName"]}"),
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         Text("Location: ${stations[0]["Location"]}"),
            //         const SizedBox(width: 115,),
            //         Text("Location: ${stations[1]["Location"]}"),
            //       ],
            //     ),
            //   ],
            // ),
          );
        } else {
          return const Text("No data available");
        }
      },
    ),
      ),
    );
  }
}