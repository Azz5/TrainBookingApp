import 'package:flutter/material.dart';
import 'package:project_frontend/screens/user_screens/trains_screen.dart';
import 'package:project_frontend/screens/user_screens/reservation_screen.dart';
import 'package:project_frontend/screens/user_screens/tickets_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _UserScreenState();
  }
}

class _UserScreenState extends State<UserScreen> {
  int index = 0;
  void onChangeIndex(int value) => setState(() {
        index = value;
      });




  @override
  Widget build(BuildContext context) {
    //FirebaseAuth auth = FirebaseAuth.instance;




    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(index == 0
            ? "Trains"
            : index == 1
                ? "Reservations"
                : "Tickets"),
        automaticallyImplyLeading: false,
      ),
      body: index == 0? const TrainsScreen() : index == 1? const ReservationScreen() : TicketsScreen(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => onChangeIndex(value),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.train), label: "Trains"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: "Reservations"),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_sharp), label: "Tickets"),
          ]),
    );
  }
}
















// ignore_for_file: use_build_context_synchronously