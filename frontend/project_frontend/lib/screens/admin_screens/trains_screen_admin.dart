
import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/admin_widgets/train_admin.dart';
import 'package:project_frontend/dataHandler/api_service.dart';

class TrainsAdminScreen extends StatefulWidget {
  const TrainsAdminScreen({super.key, required this.role, required this.staffID, required this.staffName});
  final String role;
  final int staffID;
  final String staffName;
  @override
  State<TrainsAdminScreen> createState() => _TrainsAdminScreenState();
}

class _TrainsAdminScreenState extends State<TrainsAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trains"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<dynamic>>(
          future: widget.role == "Driver"
              ? ApiService.getTrainsWithNoDriver()
              : ApiService.getTrainsWithNoEngineer(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Display a loading spinner while fetching data
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Display an error message if the API call fails
              return Center(
                child: Text(
                  "Error: ${snapshot.error}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (snapshot.hasData) {
              final scheduleData = snapshot.data!;

              if (scheduleData.isEmpty) {
                // Inform the user if no data is available
                return const Center(child: Text("No trains available."));
              }

              // Convert data to TrainAdmin widgets
              final trainWidgets = scheduleData.map<Widget>((train) {
                return TrainAdmin(
                  trainID: train["TrainID"],
                  nameEN: train["TrainName_EN"],
                  nameAR: train["TrainName_AR"],
                  role: widget.role,
                  staffID: widget.staffID,
                  staffName: widget.staffName,
                  //staffID: train["StaffID"], // Ensure this key exists
                );
              }).toList();

              // Display the trains in a GridView
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Horizontal spacing between tiles
                  mainAxisSpacing: 10, // Vertical spacing between tiles
                  //childAspectRatio: 3 / 2, // Width to height ratio of each tile
                ),
                itemCount: trainWidgets.length,
                itemBuilder: (context, index) {
                  return trainWidgets[index];
                },
              );
            } else {
              // Fallback for any other unforeseen scenarios
              return const Center(child: Text("Unexpected error occurred."));
            }
          },
        ),
      ),
    );
  }
}