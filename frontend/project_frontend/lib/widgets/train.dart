import 'package:flutter/material.dart';
import 'package:project_frontend/dataHandler/api_service.dart';

class TrainWidget extends StatelessWidget{
  const TrainWidget({super.key, required this.widget, required this.trainName});
  final Widget widget;
  final String trainName;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
      // Navigator.push(context,MaterialPageRoute(builder: (context) => widget,)),
      print(ApiService.getAllTrains());},  
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(children: [
            const Icon(Icons.train, size: 120,),
            Text(trainName,style: const TextStyle(fontSize: 20),),
          ],),
        ),
      ),
    );
  }
}