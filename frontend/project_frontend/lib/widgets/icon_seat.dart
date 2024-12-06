import 'package:flutter/material.dart';


class IconSeat extends StatefulWidget{
  const IconSeat({super.key, required this.id});
  final int id;
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
      setState(() {
        isPressed = !isPressed;

      });
    }, icon: Icon(Icons.chair, color: isPressed? const Color.fromARGB(255, 29, 13, 102) : Colors.grey,));
  }
  }