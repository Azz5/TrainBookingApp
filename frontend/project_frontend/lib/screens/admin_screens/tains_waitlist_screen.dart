import 'package:flutter/material.dart';
import 'package:project_frontend/dataHandler/api_service.dart';
import 'package:project_frontend/widgets/admin_widgets/train_waitlist.dart';

class TrainsWaitlistScreen extends StatefulWidget {
  const TrainsWaitlistScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TrainsWaitlistScreenState();
  }
}

class TrainsWaitlistScreenState extends State<TrainsWaitlistScreen> {
  List<TrainWaitlist> trains = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<dynamic>>(
        future: ApiService.getAllTrains(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            final scheduleData = snapshot.data!;

            // Map scheduleData to TrainWaitlist widgets
            final trainWidgets = scheduleData.map<Widget>((trainData) {
              return TrainWaitlist(
                trainID: trainData['TrainID'],
                name: trainData['TrainName_EN'],
                date: trainData['ScheduleDate'].substring(0,10),
              );
            }).toList();

            // Display data in a GridView
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Three widgets per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: trainWidgets.length,
              itemBuilder: (context, index) {
                return trainWidgets[index];
              },
            );
          } else {
            return const Text("No data available");
          }
        },
      ),
    );
  }
}
