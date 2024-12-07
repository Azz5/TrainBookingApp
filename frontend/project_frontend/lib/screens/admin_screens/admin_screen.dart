import 'package:flutter/material.dart';


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

    //FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(index == 0 ? "Trains" : index == 1 ? "Seats" : "Payment"),
        ),
      body: Center(
        child: GridView(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 30,
    mainAxisSpacing: 30, // Optional: To control the vertical spacing
  ),
  children: [
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text(""),
    )
  ],
),
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

// ElevatedButton(onPressed: () async{
//           await auth.signOut();
//           Navigator.pop(context);
//           }, 






// ignore_for_file: use_build_context_synchronously