import 'package:flutter/material.dart';
import 'package:project_frontend/dataHandler/api_service.dart';


class ReservationAdmin extends StatefulWidget{
  const ReservationAdmin({super.key,required this.data});
  final Map<String,dynamic> data;
  @override
  State<StatefulWidget> createState() {
    return ReservationState();
  }
}

class ReservationState extends State<ReservationAdmin>{

Future<void> showCustomModalSheet({
  required BuildContext context,
  required ValueSetter<String> onDateSelected,
  required ValueSetter<String> onSeatEntered,
}) {
  // Controllers for the text fields
  final TextEditingController dateController = TextEditingController();
  final TextEditingController seatController = TextEditingController();



  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Enter Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Custom Date Field
            _CustomTextField(
              controller: dateController,
              label: "Date",
              icon: Icons.calendar_today,
              readOnly: true,
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  dateController.text =
                      "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
                }
              },
            ),
            const SizedBox(height: 20),
            // Custom Seat Number Field
            _CustomTextField(
              controller: seatController,
              label: "Seat Number",
              icon: Icons.chair,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // Submit Button
            ElevatedButton(
              onPressed: () async{
                if (dateController.text.isNotEmpty &&
                    seatController.text.isNotEmpty) {
                  onDateSelected(dateController.text);
                  onSeatEntered(seatController.text);
                  Navigator.of(context).pop(); // Close the modal
                  String id = widget.data["ReservationID"];
              print(widget.data);
                  widget.data["Date"] = dateController.text;
                  print(widget.data);
                  widget.data["SeatNumber"] = seatController.text;
                  print(widget.data);
                  print(id);
                  await ApiService.updatePassenger(id, widget.data);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please fill in all fields."),
                    ),
                  );
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      );
    },
  );
}
  String selectedDate = "";
  String seatNumber = "";
  @override
  Widget build(BuildContext context) {
    int reservationID = widget.data["ReservationID"];
    String trainID = widget.data["TrainID"];
    int passengerID = widget.data["PassengerID"];
    String paymentStatus = widget.data["PaymentStatus"];
    int seat = widget.data["SeatNumber"];
    String date = widget.data["Date"].substring(0,10);
    return InkWell(
      onTap: (){

       
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 110,
        width: 500,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Train ID: $trainID"),
                    Text("Passenger ID: $passengerID"),
                    Text("Reservation ID: $reservationID"),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date: $date"),
                        Text("Seat No: $seat"),
                        Text("Payment Status: $paymentStatus")
                      ],
                    ),
                    IconButton(onPressed: ()async{
                      await showCustomModalSheet(context: context, onDateSelected: (date){
                        selectedDate = date;}, 
                        onSeatEntered: (seat){selectedDate = seat;}
                        
                        );

                    }, icon: const Icon(Icons.settings))
                  ],
                ),
                const SizedBox(width: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;

  const _CustomTextField({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
      onTap: onTap,
    );
  }
}