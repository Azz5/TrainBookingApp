import 'package:flutter/material.dart';
import 'package:project_frontend/screens/admin_screens/modifications_screen.dart';
import 'package:project_frontend/screens/admin_screens/stations_screen.dart';
import 'package:project_frontend/widgets/admin_widgets/staff_card.dart';
import 'package:project_frontend/screens/admin_screens/staff_screen.dart';


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
        title: Text(index == 0 ? "Reservations" : index == 1 ? "Stations" : index == 2? "Staff" : "Waitlist"),
        
        ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: index == 0? const ModificationsScreen() : index == 1? const StationsScreen() : const StaffScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: const Color.fromARGB(217, 255, 255, 255),
        type: BottomNavigationBarType.fixed,
        onTap: (value) => onChangeIndex(value),
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.train), label: "Reservations"),
        BottomNavigationBarItem(icon: Icon(Icons.horizontal_distribute_rounded), label: "Stations"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Staff"),
        BottomNavigationBarItem(icon: Icon(Icons.hourglass_top_outlined),label:  "Waitlist"),
      ]),
    );
  }
}

// ElevatedButton(onPressed: () async{
//           await auth.signOut();
//           Navigator.pop(context);
//           }, 






// ignore_for_file: use_build_context_synchronously