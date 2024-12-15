import 'package:flutter/material.dart';
import 'package:project_frontend/models/models.dart';

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
      //String id = widget.id.toString().padLeft(3, '0');
      int index = int.parse(widget.id.toString()[0]);
      int c = int.parse(widget.id.toString()[1]);
      int r = int.parse(widget.id.toString()[2]);
      setState(() {
        isPressed = !isPressed;

        seatsMapbyID[index]?[c][r] = IconSeat(isReserved: isPressed, id: widget.id);

        
      });

      
    }, icon: Icon(Icons.chair, color: (isPressed || widget.isReserved)? const Color.fromARGB(255, 29, 13, 102) : Colors.grey,));
  }
  }