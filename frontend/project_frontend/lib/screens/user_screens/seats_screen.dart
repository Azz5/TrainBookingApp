import "package:flutter/material.dart";
import 'package:project_frontend/widgets/icon_seat.dart';
import 'package:project_frontend/models/models.dart';






  

List<List<IconSeat>> copiedIconsList = icons.map((row) => [...row]).toList();

class SeatsScreen extends StatelessWidget {
  const SeatsScreen({super.key, required this.departureTime, required this.arrivalTime, required this.scheduleID});
  final String departureTime;
  final String arrivalTime;
  final int scheduleID;
  //final Seats seats;

  @override
  Widget build(BuildContext context) {
    List<List<IconSeat>> seatsList = icons;

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
                                              const Text("Dammam")
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
                                              const Text("Riyadh")
                                            ],
                                          )
                                        ],
                                      ),
                          ],
                        ),
          
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

                    //bool isChanged = !(const DeepCollectionEquality().equals(icons, seatsMapbyID[scheduleID]));
                    

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





