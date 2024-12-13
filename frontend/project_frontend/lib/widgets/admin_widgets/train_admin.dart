import 'package:flutter/material.dart';

class TrainAdmin extends StatefulWidget{
  const TrainAdmin({super.key, required this.trainID, required this.nameEN, required this.nameAR, required this.staffID});
  final String trainID;
  final String nameEN;
  final String nameAR;
  final int staffID;
  @override
  State<StatefulWidget> createState() {
    return TrainAdminState();
  }
}


class TrainAdminState extends State<TrainAdmin>{


    String chosenDate = "";
    Future<void> selectDate() async{
    DateTime? pickedDate = await showDatePicker(
      context: context, 
      initialDate: null,
      firstDate: DateTime.now(), 
      lastDate: DateTime(2025)
      );

      if (pickedDate != null){
        setState(() {
          chosenDate = pickedDate.toString();
          chosenDate = chosenDate.substring(0,10);
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 300,
     // width: 100,
      child: Card(
        child: Column(
          children: [
            const SizedBox(height: 15,),
            const Text("ID"),
            const Icon(Icons.train_rounded,color: Color.fromARGB(255, 34, 9, 73),size: 99,),
            const Row(
              children: [
                Text("EN Name"),
                Spacer(),
                Text("AR Name"),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: (){selectDate();},style: const ButtonStyle(iconColor: WidgetStatePropertyAll(Color.fromARGB(255, 34, 9, 73))) ,icon: const Icon(Icons.date_range)),
                SizedBox(
                  width: 83,
                  child: chosenDate == "" ? const Text("") : Text(chosenDate),
                  ),
                TextButton(onPressed: (){selectDate();}, child: const Text("Assign"))
              ],
            ),
          

          ],
        ),
      ),
    );
  }
}