import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/trip.dart';
import 'package:project_frontend/screens/user_screens/seats_screen.dart';
import 'package:project_frontend/models/location_filters.dart';
import 'package:project_frontend/dataHandler/api_service.dart';
import 'package:project_frontend/models/models.dart';
import 'package:project_frontend/widgets/icon_seat.dart';

class TrainsScreen extends StatefulWidget {
  const TrainsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TrainsScreenState();
  }
}

class _TrainsScreenState extends State<TrainsScreen> {
  String chosenDate = "";

  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      setState(() {
        chosenDate = pickedDate.toString().substring(0, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<LocationFilter, bool> fromFilter = {
      LocationFilter.riyadh: false,
      LocationFilter.dammam: false,
      LocationFilter.jeddah: false,
      LocationFilter.abhah: false,
    };

    Map<LocationFilter, bool> toFilter = {
      LocationFilter.riyadh: false,
      LocationFilter.dammam: false,
      LocationFilter.jeddah: false,
      LocationFilter.abhah: false,
    };

    return Column(
      children: [
        // Date and Filter UI
        Container(
          padding: const EdgeInsets.all(12),
          height: 170,
          child: Card(
            child: Column(
              children: [
                Row(
                  children: [
                    DropdownMenu<LocationFilter>(
                      leadingIcon: const Icon(Icons.location_on_outlined),
                      hintText: "From",
                      onSelected: (LocationFilter? filter) {
                        if (filter != null) {
                          setState(() {
                            fromFilter.forEach((key, _) {
                              fromFilter[key] = key == filter;
                            });
                          });
                        }
                      },
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(
                            value: LocationFilter.riyadh, label: "Riyadh"),
                        DropdownMenuEntry(
                            value: LocationFilter.dammam, label: "Dammam"),
                        DropdownMenuEntry(
                            value: LocationFilter.jeddah, label: "Jeddah"),
                        DropdownMenuEntry(
                            value: LocationFilter.abhah, label: "Abhah"),
                      ],
                    ),
                    const Icon(Icons.arrow_right_alt),
                    SizedBox(
                      width: 174,
                      child: DropdownMenu<LocationFilter>(
                        leadingIcon: const Icon(Icons.location_on_outlined),
                        hintText: "To",
                        onSelected: (LocationFilter? filter) {
                          if (filter != null) {
                            setState(() {
                              toFilter.forEach((key, _) {
                                toFilter[key] = key == filter;
                              });
                            });
                          }
                        },
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(
                              value: LocationFilter.riyadh, label: "Riyadh"),
                          DropdownMenuEntry(
                              value: LocationFilter.dammam, label: "Dammam"),
                          DropdownMenuEntry(
                              value: LocationFilter.jeddah, label: "Jeddah"),
                          DropdownMenuEntry(
                              value: LocationFilter.abhah, label: "Abhah"),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: selectDate,
                        child: const Icon(Icons.date_range),
                      ),
                      const SizedBox(width: 50),
                      const Text("Date:", style: TextStyle(fontSize: 25)),
                      const SizedBox(width: 20),
                      chosenDate.isEmpty
                          ? const SizedBox.shrink()
                          : Text(chosenDate, style: const TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Trip List
        Expanded(
          child: FutureBuilder<List<dynamic>>(
            future: ApiService.getAllSchedules(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.hasData) {
                final scheduleData = snapshot.data!;
                List<Trip> trips = scheduleData
                    .where((data) =>
                        chosenDate.isEmpty ||
                        data["ScheduleDate"].substring(0, 10) == chosenDate)
                    .map((data) {
                  final trip = Schedule(
                    data['ScheduleID'].toString(),
                    data['DepartureTime'],
                    data['ArrivalTime'],
                    "Dammam", // Replace with actual data if available
                    "Riyadh", // Replace with actual data if available
                    data['TrainID'],
                    data["ScheduleDate"],
                  );

                  final seatScreen = SeatsScreen(
                    departureTime: trip.departureTime,
                    arrivalTime: trip.arrivalTime,
                    scheduleID: int.parse(trip.scheduleId),
                  );

                  return Trip(
                    arrivalTime: trip.arrivalTime,
                    departureTime: trip.departureTime,
                    trainNo: trip.scheduleId,
                    departureCity: trip.departureCity,
                    arrivalCity: trip.arrivalCity,
                    seatScreen: seatScreen,
                  );
                }).toList();

                return ListView(children: trips);
              } else {
                return const Text("No data available");
              }
            },
          ),
        ),
      ],
    );
  }
}