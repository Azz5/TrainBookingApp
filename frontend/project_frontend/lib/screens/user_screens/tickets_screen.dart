import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/ticket.dart';

class TicketsScreen extends StatelessWidget{
  List<Ticket> tickets = [Ticket(),Ticket()];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          ...tickets,
        ],
      ),
    );
  }
}