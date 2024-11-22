import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AdminScreen extends StatefulWidget{
  const AdminScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return AdminScreenState();
  }
}

class AdminScreenState extends State<AdminScreen>{
  int index = 0;
  void onChangeIndex(int value)=> setState(() {index = value;});
  @override
  Widget build(BuildContext context) {

    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async{
          await auth.signOut();
          Navigator.pop(context);
          }, 
        child: const Text("Logout")),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => onChangeIndex(value),
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.train), label: "Tickets"),
        BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "Assign Staff"),
        BottomNavigationBarItem(icon: Icon(Icons.list),label:  "Waitlist"),
      ]),
    );
  }
}






// ignore_for_file: use_build_context_synchronously