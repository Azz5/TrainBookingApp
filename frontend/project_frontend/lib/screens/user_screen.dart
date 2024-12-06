import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_frontend/screens/train_screen.dart';
import 'package:project_frontend/models/location_filters.dart';
import 'package:project_frontend/widgets/trip.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _UserScreenState();
  }
}

class _UserScreenState extends State<UserScreen> {
  int index = 0;
  String chosenDate = "";
  void onChangeIndex(int value) => setState(() {
        index = value;
      });
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

List<Trip> trips = [
  const Trip(arrivalTime: "9:00am", departureTime: "7:00am", trainNo: 1, departureCity: "Dammam", arrivalCity: "Riyadh",reserveScreen: TrainScreen(),),
  const Trip(arrivalTime: "9:00am", departureTime: "7:00am", trainNo: 1, departureCity: "Dammam", arrivalCity: "Riyadh",reserveScreen: TrainScreen(),),
  const Trip(arrivalTime: "9:00am", departureTime: "7:00am", trainNo: 1, departureCity: "Dammam", arrivalCity: "Riyadh", reserveScreen: TrainScreen(),),
  const Trip(arrivalTime: "9:00am", departureTime: "7:00am", trainNo: 1, departureCity: "Dammam", arrivalCity: "Riyadh", reserveScreen: TrainScreen(),),
  ];

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth auth = FirebaseAuth.instance;

    TextEditingController controller = TextEditingController();

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

    return Scaffold(
      appBar: AppBar(
        title: Text(index == 0
            ? "Trains"
            : index == 1
                ? "Seats"
                : "Payment"),
        actions: [
          index == 0
              ? AnimSearchBar(
                  width: 420,
                  textController: controller,
                  onSuffixTap: (),
                  onSubmitted: (String str) {})
              : Container()
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
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
                        width: 180,
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
                ...trips
              ],
            )),

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
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => onChangeIndex(value),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.train), label: "Trains Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: "Seats Booking"),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment), label: "Payment"),
          ]),
    );
  }
}














// ignore_for_file: use_build_context_synchronously