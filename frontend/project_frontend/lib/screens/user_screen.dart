import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserScreen extends StatefulWidget{
  const UserScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _UserScreenState();
  }
}


class _UserScreenState extends State<UserScreen>{
  int index = 0;
  void onChangeIndex(int value)=> setState(() {index = value;});
  @override
  Widget build(BuildContext context) {

    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async{
          await auth.signOut();
          Navigator.pop(context);}, 
        child: const Text("Logout")),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => onChangeIndex(value),
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.train), label: "Trains Search"),
        BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "Seats Booking"),
        BottomNavigationBarItem(icon: Icon(Icons.payment),label:  "Payment"),
      ]),
    );
  }
}














// ignore_for_file: use_build_context_synchronously