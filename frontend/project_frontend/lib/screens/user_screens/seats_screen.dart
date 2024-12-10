import "package:flutter/material.dart";
import 'package:project_frontend/widgets/icon_seat.dart';
import 'package:project_frontend/models/models.dart';
import 'package:collection/collection.dart';

  // List<List<IconSeat>> icons = [
  //   [
  //     const IconSeat(isReserved: false,id: 00,),
  //     const IconSeat(isReserved: false,id: 01,),
  //     const IconSeat(isReserved: false, id: 02,),
  //     const IconSeat(isReserved: false,id: 03,),
  //     const IconSeat(isReserved: false,id: 04,),
  //     const IconSeat(isReserved: false, id: 05,),
  //     const IconSeat(isReserved: false,id: 06,),
  //     const IconSeat(isReserved: false,id: 07,),
  //     const IconSeat(isReserved: false, id: 08,),
  //     const IconSeat(isReserved: false, id: 09)
  //   ],
  //   [
  //     const IconSeat(isReserved: false,id: 10,),
  //     const IconSeat(isReserved: false,id: 11,),
  //     const IconSeat(isReserved: false, id: 12,),
  //     const IconSeat(isReserved: false,id: 13,),
  //     const IconSeat(isReserved: false,id: 14,),
  //     const IconSeat(isReserved: false, id: 15,),
  //     const IconSeat(isReserved: false,id: 16,),
  //     const IconSeat(isReserved: false,id: 17,),
  //     const IconSeat(isReserved: false, id: 18,),
  //     const IconSeat(isReserved: false, id: 19)
  //   ],
  //   [
  //     const IconSeat(isReserved: false,id: 20,),
  //     const IconSeat(isReserved: false,id: 21,),
  //     const IconSeat(isReserved: false, id: 22,),
  //     const IconSeat(isReserved: false,id: 23,),
  //     const IconSeat(isReserved: false,id: 24,),
  //     const IconSeat(isReserved: false, id: 25,),
  //     const IconSeat(isReserved: false,id: 26,),
  //     const IconSeat(isReserved: false,id: 27,),
  //     const IconSeat(isReserved: false, id: 28,),
  //     const IconSeat(isReserved: false, id: 29)
  //   ],
  //   [
  //     const IconSeat(isReserved: false,id: 30,),
  //     const IconSeat(isReserved: false,id: 31,),
  //     const IconSeat(isReserved: false, id: 32,),
  //     const IconSeat(isReserved: false,id: 33,),
  //     const IconSeat(isReserved: false,id: 34,),
  //     const IconSeat(isReserved: false, id: 35,),
  //     const IconSeat(isReserved: false,id: 36,),
  //     const IconSeat(isReserved: false,id: 37,),
  //     const IconSeat(isReserved: false, id: 38,),
  //     const IconSeat(isReserved: false, id: 39)

  //   ],
  // ];

  

List<List<IconSeat>> copiedIconsList = icons.map((row) => [...row]).toList();

class SeatsScreen extends StatelessWidget {
  const SeatsScreen({super.key, required this.departureTime, required this.arrivalTime, required this.scheduleID});
  final String departureTime;
  final String arrivalTime;
  final int scheduleID;
  //final Seats seats;

  @override
  Widget build(BuildContext context) {
    List<List<IconSeat>> seatsList = seatsMapbyID[scheduleID]!;
    

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100))),
                        child: Column(
                          children: [
                            const SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ///
                                          const SizedBox(width: 30,),
                                          Column(
                                            children: [
                                              Text(departureTime, style: const TextStyle(fontSize: 20),),
                                              Text("Dammam")
                                            ],
                                          ),
                                          //const Icon(Icons.arrow_right_alt_sharp),
                                          const SizedBox(width: 15,),
                                          const Column(
                                            children: [
                                              Text(".........",style: TextStyle(fontSize: 20),),
                                              Icon(Icons.arrow_right_alt)
                                            ],
                                          ),
                                          const SizedBox(width: 15,),
                                          Column(
                                            children: [
                                              Text(arrivalTime, style: const TextStyle(fontSize: 20),),
                                              Text("Riyadh")
                                            ],
                                          )
                                        ],
                                      ),
                          ],
                        ),
          ///
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [...seatsList[0]],
                ),
                Column(
                  children: [...seatsList[1]],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [...seatsList[2]],
                ),
                Column(
                  children: [...seatsList[3]],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                    // bool isChanged = !const DeepCollectionEquality().equals(icons, copiedIconsList);
                    bool isChanged = !(const DeepCollectionEquality().equals(icons, seatsMapbyID[scheduleID]));
                    print(icons);
                    print(seatsMapbyID[scheduleID]);  
                        if (isChanged) {
                            Navigator.pop(context);
                        }
                },
                style: const ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(255, 75, 7, 87)),
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.only(left: 140, right: 140))),
                child: const Text("Reserve"))
          ],
        ),
      ),
    );
  }
}













  // final List<List<IconSeat>> seatsList = const [
  // [
  //    IconSeat(id: 1,),
  //   IconSeat(
  //     id: 2,
  //   ),
  //   IconSeat(
  //     id: 3,
  //   ),
  //   IconSeat(
  //     id: 4,
  //   ),
  //   IconSeat(
  //     id: 5,
  //   ),
  //   IconSeat(
  //     id: 6,
  //   ),
  //   IconSeat(
  //     id: 7,
  //   ),
  //   IconSeat(
  //     id: 8,
  //   ),
  //   IconSeat(
  //     id: 9,
  //   ),
  //   IconSeat(
  //     id: 10,
  //   ),
  // ],
  // [
  //   IconSeat(
  //     id: 1,
  //   ),
  //   IconSeat(
  //     id: 2,
  //   ),
  //   IconSeat(
  //     id: 3,
  //   ),
  //   IconSeat(
  //     id: 4,
  //   ),
  //   IconSeat(
  //     id: 5,
  //   ),
  //   IconSeat(
  //     id: 6,
  //   ),
  //   IconSeat(
  //     id: 7,
  //   ),
  //   IconSeat(
  //     id: 8,
  //   ),
  //   IconSeat(
  //     id: 9,
  //   ),
  //   IconSeat(
  //     id: 10,
  //   ),
  // ],
  // [
  //   IconSeat(
  //     id: 1,
  //   ),
  //   IconSeat(
  //     id: 2,
  //   ),
  //   IconSeat(
  //     id: 3,
  //   ),
  //   IconSeat(
  //     id: 4,
  //   ),
  //   IconSeat(
  //     id: 5,
  //   ),
  //   IconSeat(
  //     id: 6,
  //   ),
  //   IconSeat(
  //     id: 7,
  //   ),
  //   IconSeat(
  //     id: 8,
  //   ),
  //   IconSeat(
  //     id: 9,
  //   ),
  //   IconSeat(
  //     id: 10,
  //   ),
  // ],
  //   [
  //         IconSeat(
  //     id: 1,
  //   ),
  //   IconSeat(
  //     id: 2,
  //   ),
  //   IconSeat(
  //     id: 3,
  //   ),
  //   IconSeat(
  //     id: 4,
  //   ),
  //   IconSeat(
  //     id: 5,
  //   ),
  //   IconSeat(
  //     id: 6,
  //   ),
  //   IconSeat(
  //     id: 7,
  //   ),
  //   IconSeat(
  //     id: 8,
  //   ),
  //   IconSeat(
  //     id: 9,
  //   ),
  //   IconSeat(
  //     id: 10,
  //   ),
  //   ],
  // ];