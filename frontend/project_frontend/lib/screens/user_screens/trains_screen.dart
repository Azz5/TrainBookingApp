import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/trip.dart';
import 'package:project_frontend/screens/user_screens/seats_screen.dart';
import 'package:project_frontend/models/location_filters.dart';
import 'package:project_frontend/dataHandler/api_service.dart';
import 'package:project_frontend/models/models.dart';
import 'package:project_frontend/widgets/icon_seat.dart';





class TrainsScreen extends StatefulWidget{
  const TrainsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TrainsScreenState();
  }
}

class _TrainsScreenState extends State<TrainsScreen>{






// late Future<List<dynamic>> stations;



// @override
//   void initState() {
//     super.initState();
//     stations = ApiService.getAllSchedules();  // Call the method and assign to stations
//   }




  String chosenDate = "";
    Future<void> selectDate() async{
    DateTime? pickedDate = await showDatePicker(
      context: context, 
      initialDate: null,
      firstDate: DateTime.now(), 
      lastDate: DateTime(2025)
      );

      if (pickedDate != null){
        chosenDate = pickedDate.toString();
        setState(() {
          chosenDate = chosenDate.substring(0,10);
        });
      }
  }

  List<SeatsScreen> seatScreens = [];
  //List<List<IconSeat>> icons = [];
  
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
                            filter != null
                                ? setState(() {
                                    fromFilter[filter] = true;
                                    fromFilter.forEach((key, _) {
                                      if (key != filter) fromFilter[key] = false;
                                    });
                                  })
                                : null;
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
                          ]),
                      const Icon(Icons.arrow_right_alt),
                                          SizedBox(
                        width: 174,
                        child: DropdownMenu<LocationFilter>(
                          leadingIcon: const Icon(Icons.location_on_outlined),
                            hintText: "To",
                            onSelected: (LocationFilter? filter) {
                              filter != null
                                  ? setState(() {
                                      toFilter[filter] = true;
                                      toFilter.forEach((key, _) {
                                        if (key != filter) toFilter[key] = false;
                                      });
                                    })
                                  : null;
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
                            ]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        ElevatedButton(onPressed: (){selectDate();}, child: const Icon(Icons.date_range)),
                        const SizedBox(width: 50,),
                        const Text("Date:",style: TextStyle(fontSize: 25),),
                        const SizedBox(width: 20,),
                        chosenDate == ""? const SizedBox.shrink() : Text(chosenDate,style: const TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),                  
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView(
  children: [
    FutureBuilder<List<dynamic>>(
      future: ApiService.getAllSchedules(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          final scheduleData = snapshot.data!;
          List<Trip> trips = [];
          
          for (int i = 0; i < scheduleData.length; i++) { 
            Schedule trip = Schedule(
              scheduleData[i]['ScheduleID'].toString(),
              scheduleData[i]['DepartureTime'],
              scheduleData[i]['ArrivalTime'],
              "Dammam",
              "Riyadh",
              scheduleData[i]['TrainID'],
            );
            schedules.add(trip);
            SeatsScreen screen = SeatsScreen(departureTime: trip.departureTime,arrivalTime: trip.arrivalTime,scheduleID: int.parse(trip.scheduleId),);
            List<List<IconSeat>> copiedIconsList = icons.map((row) => [...row]).toList();
            seatsMapbyID[int.parse(trip.scheduleId)] = copiedIconsList;
            String id = trip.scheduleId;
            for (int k = 0; k < 4; k++){
              for (int j = 0; j < 10; j++){
                String a = k.toString();
                String b = j.toString();
                String localID = "";
                localID = id + a + b;
                seatsMapbyID[int.parse(trip.scheduleId)]?[k][j] = IconSeat(isReserved: false, id: int.parse(localID));
              }
            }
            
            trips.add(Trip(
              arrivalTime: trip.arrivalTime,
              departureTime: trip.departureTime,
              trainNo: trip.scheduleId,
              departureCity: trip.departureCity,
              arrivalCity: trip.arrivalCity,
              seatScreen: screen,
            ));
           seatScreens.add(screen); 
          }

          // Spread the `trips` list into the `children` of another ListView
          return Column(
            children: trips,
          );
        } else {
          return const Text("No data available");
        }
      },
    ),
  ],
)
            ),

          // Expanded(
          //   child: GridView(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 10,
          //       mainAxisSpacing:
          //           100, 
          //     ),
          //     children: const [
          //       TrainWidget(
          //           widget: TrainScreen(name: "TrainA"), trainName: "TrainA"),
          //       TrainWidget(
          //           widget: TrainScreen(name: "TrainB"), trainName: "TrainB"),
          //       TrainWidget(
          //           widget: TrainScreen(name: "TrainC"), trainName: "TrainC"),
          //       TrainWidget(
          //           widget: TrainScreen(name: "TrainD"), trainName: "TrainD"),
          //     ],
          //   ),
          // ),
        ],
      );
  }
}