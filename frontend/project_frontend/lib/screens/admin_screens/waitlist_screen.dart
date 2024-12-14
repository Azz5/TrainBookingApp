import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/admin_widgets/waitlist_card.dart';
import 'package:project_frontend/dataHandler/api_service.dart';

class WaitlistScreen extends StatelessWidget{
  const WaitlistScreen({super.key, required this.trainID});
  final String trainID;
  @override
  Widget build(BuildContext context) {
    List<WaitlistCard> waitCards = [];
    return Scaffold(
      appBar: AppBar(title: const Text("Waitlist Passengers"),centerTitle: true,),
      body: Center(
        child: ListView(
          children: [
            FutureBuilder(
          future: ApiService.getWaitlistByTrain(trainID), 
          builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          final scheduleData = snapshot.data!;
          for (int i = 0; i < scheduleData.length; i++){
            
            waitCards.add( WaitlistCard(classism: scheduleData[i]["Class"],passengerID: scheduleData[i]["PassengerID"],priority: scheduleData[i]["Priority"],waitlistID: scheduleData[i]["WaitlistID"],));
          }
          return Column(
            children: [
              ...waitCards,
            ]
          );
        } else {
          return const Text("No data available");
        }
      },
          ),
          ],
        ),
      ),
    );
  }
}