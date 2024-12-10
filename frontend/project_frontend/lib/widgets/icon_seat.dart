import 'package:flutter/material.dart';
import 'package:project_frontend/screens/user_screens/seats_screen.dart';

class IconSeat extends StatefulWidget{
  const IconSeat({super.key,required this.isReserved, required this.id});
  final int id;
  final bool isReserved;

  @override
  State<StatefulWidget> createState() {
    return _IconSeat();
  }
}
  class _IconSeat extends State<IconSeat>{
    bool isPressed = false;
    @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      String id = widget.id.toString().padLeft(2, '0');
      int c = int.parse(id[0]);
      int r = int.parse(id[1]);
      setState(() {
        isPressed = !isPressed;
        icons[c][r] = IconSeat(isReserved: isPressed, id: int.parse(id));
      });
      // widget.isReserved makes the pressed unpressable and saved, remove it makes the press pressable and unsaved
    }, icon: Icon(Icons.chair, color: (isPressed || widget.isReserved)? const Color.fromARGB(255, 29, 13, 102) : Colors.grey,));
  }
  }