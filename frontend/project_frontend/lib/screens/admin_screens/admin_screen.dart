import 'package:flutter/material.dart';
import 'package:project_frontend/screens/admin_screens/modifications_screen.dart';
import 'package:project_frontend/screens/admin_screens/stations_screen.dart';
import 'package:project_frontend/widgets/admin_widgets/staff_card.dart';
import 'package:project_frontend/screens/admin_screens/staff_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_frontend/screens/registration_screens/login_screen.dart';
import 'package:project_frontend/screens/admin_screens/tains_waitlist_screen.dart';




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

  void logOut(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login');
    print("fasdfdsfsdafdfdsafads");
  } catch (e) {
    print('Error during logout: $e');
  }
}
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
                color: Color.fromARGB(255, 78, 39, 176),
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                logOut(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: index == 0? const ModificationsScreen() : index == 1? const StationsScreen() : index == 2? const StaffScreen() : const TrainsWaitlistScreen(),
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