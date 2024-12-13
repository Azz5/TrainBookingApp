import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/admin_widgets/train_admin.dart';
import 'package:project_frontend/dataHandler/api_service.dart';

class TrainsAdminScreen extends StatefulWidget{
  const TrainsAdminScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return TrainsAdminScreenState();
  }
}

class TrainsAdminScreenState extends State<TrainsAdminScreen>{
  List<TrainAdmin> trains = const [TrainAdmin(trainID: "fsda", nameEN: "FSsdf", nameAR: "fdsfa", staffID: 12)];
  //   List<TrainAdmin> trainsWidget = []; // Initialize an empty list of TrainAdmin
  // List<Map<String, dynamic>> trains = [];
  // List<Map<String, dynamic>> schedules = [];
  // List<Map<String, dynamic>> staff = [];
  // String trainID = "";

  //   @override
  // void initState() {
  //   super.initState();
  //   _fetchTrains(); // Fetch trains when the widget is initialized
  //   for (int i = 0; i < staff.length; i++){
  //     for (int j = 0; j < trains.length; j++){
  //       if (staff[i]["AssignedTrainID"] == trains[j]["TrainID"]){
  //         trainsWidget.add(TrainAdmin(trainID: trains[j]["TrainID"], nameEN: trains[j]["TrainName_EN"], nameAR: trains[j]["TrainName_EN"], staffID: staffID))
  //       }
  //     }
  //   }

  // }

  //   Future<void> _fetchTrains() async {
  //   try {
  //     final fetchedTrains = await ApiService.getAllTrains(); // Call the API method
  //     setState(() {
  //       trains = List<Map<String, dynamic>>.from(fetchedTrains); // Store the data in the list
  //     });
  //   } catch (e) {
  //     // Handle error (e.g., show an error message)
  //     print('Error fetching trains: $e');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trains"),),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 50,
            
            ),
            shrinkWrap: true,
          children: [
            ...trains
          ],
        ),
      ),
    );
  }
}