// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/card_textfield.dart';
import 'package:project_frontend/widgets/cvv_textfield.dart';
import 'package:project_frontend/dataHandler/api_service.dart';


class PaymentScreen  extends StatefulWidget{
  const PaymentScreen({super.key, required this.id, required this.reservationData});
  final int id;
  final Map<String,dynamic> reservationData;

  @override
  State<StatefulWidget> createState() {
    return PaymentScreenState();
  }

}


class PaymentScreenState extends State<PaymentScreen>{
  bool isCCfull = false;
  bool isCVVfull = false;


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment"),centerTitle: true,),
      body: SizedBox(
        height: double.infinity,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CreditCardTextField(
              onChanged: (input){
                if (input.length == 16){
                  isCCfull = true;
                }
              },
            ),
            CVVTextField(
              onChanged: (input) {
                if (input.length == 3){
                  isCVVfull = true;
                }
              },
            ),
            const SizedBox(height: 150,),
            const Text("Price: 60SR", style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 150,),
            ElevatedButton(
              onPressed: () async{
                if (isCCfull && isCVVfull){
                  widget.reservationData["PaymentStatus"] = "Paid";

                 await ApiService.updateReservation(widget.id.toString(), widget.reservationData);
                  Navigator.pop(context);
                  //await ApiService.createTicket(ticketData);
                }
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 69, 39, 176)),foregroundColor: WidgetStatePropertyAll(Colors.white)), 
              child: const Text("Confirm Payment"))
          ],
        ),
      ),
    
    );
  }
}