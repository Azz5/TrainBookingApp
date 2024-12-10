import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/card_textfield.dart';
import 'package:project_frontend/widgets/cvv_textfield.dart';


class PaymentScreen  extends StatelessWidget{
  const PaymentScreen({super.key});
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
            //CreditCardTextField(),
            //const SizedBox(height: 200,),
            CVVTextField(),
            //const SizedBox(height: 300,),
            ElevatedButton(onPressed: (){}, child: const Text("Confirm Payment"))
          ],
        ),
      ),
    
    );
  }
}