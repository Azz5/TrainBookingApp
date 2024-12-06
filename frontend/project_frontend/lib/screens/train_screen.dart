import "package:flutter/material.dart";
import 'package:project_frontend/widgets/icon_seat.dart';

class TrainScreen extends StatelessWidget {
  const TrainScreen({super.key});
  final List<IconSeat> seatsC1 = const [
    IconSeat(
      id: 1,
    ),
    IconSeat(
      id: 2,
    ),
    IconSeat(
      id: 3,
    ),
    IconSeat(
      id: 4,
    ),
    IconSeat(
      id: 5,
    ),
    IconSeat(
      id: 6,
    ),
    IconSeat(
      id: 7,
    ),
    IconSeat(
      id: 8,
    ),
    IconSeat(
      id: 9,
    ),
    IconSeat(
      id: 10,
    ),
  ];
  final List<IconSeat> seatsC2 = const [
    IconSeat(
      id: 11,
    ),
    IconSeat(
      id: 12,
    ),
    IconSeat(
      id: 13,
    ),
    IconSeat(
      id: 14,
    ),
    IconSeat(
      id: 15,
    ),
    IconSeat(
      id: 16,
    ),
    IconSeat(
      id: 17,
    ),
    IconSeat(
      id: 18,
    ),
    IconSeat(
      id: 19,
    ),
    IconSeat(
      id: 20,
    ),
  ];
  final List<IconSeat> seatsC3 = const [
    IconSeat(
      id: 21,
    ),
    IconSeat(
      id: 22,
    ),
    IconSeat(
      id: 23,
    ),
    IconSeat(
      id: 24,
    ),
    IconSeat(
      id: 25,
    ),
    IconSeat(
      id: 26,
    ),
    IconSeat(
      id: 27,
    ),
    IconSeat(
      id: 28,
    ),
    IconSeat(
      id: 29,
    ),
    IconSeat(
      id: 30,
    ),
  ];
  final List<IconSeat> seatsC4 = const [
    IconSeat(
      id: 31,
    ),
    IconSeat(
      id: 32,
    ),
    IconSeat(
      id: 33,
    ),
    IconSeat(
      id: 34,
    ),
    IconSeat(
      id: 35,
    ),
    IconSeat(
      id: 36,
    ),
    IconSeat(
      id: 37,
    ),
    IconSeat(
      id: 38,
    ),
    IconSeat(
      id: 39,
    ),
    IconSeat(
      id: 40,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100))),
                        child: Column(
                          children: [
                            SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ///
                                          SizedBox(width: 30,),
                                          Column(
                                            children: [
                                              Text("7:00am", style: TextStyle(fontSize: 20),),
                                              Text("Dammam")
                                            ],
                                          ),
                                          //const Icon(Icons.arrow_right_alt_sharp),
                                          SizedBox(width: 15,),
                                          Column(
                                            children: [
                                              Text(".........",style: TextStyle(fontSize: 20),),
                                              Icon(Icons.arrow_right_alt)
                                            ],
                                          ),
                                          SizedBox(width: 15,),
                                          Column(
                                            children: [
                                              Text("9:00am", style: TextStyle(fontSize: 20),),
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
                  children: [...seatsC1],
                ),
                Column(
                  children: [...seatsC2],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [...seatsC3],
                ),
                Column(
                  children: [...seatsC4],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {},
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
