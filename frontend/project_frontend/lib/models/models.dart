import 'package:project_frontend/widgets/trip.dart';
import 'package:project_frontend/widgets/icon_seat.dart';

class Schedule{
  String scheduleId;
  String departureTime;
  String arrivalTime;
  String departureCity;
  String arrivalCity;
  String trainId;
  Schedule(
    this.scheduleId,
    this.departureTime,
    this.arrivalTime,
    this.departureCity,
    this.arrivalCity,
    this.trainId,
  );
}

List<Schedule> schedules = [];

class Train{
  String trainID;
  String trainNameEN;
  String trainNameAR;
  String originStationID;
  String destinationStationID;
  String scheduleDate;
  Train(
    this.trainID,
    this.trainNameEN,
    this.trainNameAR,
    this.originStationID,
    this.destinationStationID,
    this.scheduleDate
  );

}


class Reservation{
  int day;
  String month;
  List<String> seat;
  bool paid;

  Reservation(
    this.day,
    this.month,
    this.seat,
    this.paid
  );
}

class Seats{
  // List<List<int>> seats = [
  //   [0,0,0,0,0,0,0,0,0,0],
  //   [0,0,0,0,0,0,0,0,0,0],
  //   [0,0,0,0,0,0,0,0,0,0],
  //   [0,0,0,0,0,0,0,0,0,0],
  // ];
  List<Map<int,bool>> reservedSeats = [
  {
    1 : false,
    2 : false,
    3 : false,
    4 : false,
    5 : false,
    6 : false,
    7 : false,
    8 : false,
    9 : false,
    10 : false,
  },
    {
    1 : false,
    2 : false,
    3 : false,
    4 : false,
    5 : false,
    6 : false,
    7 : false,
    8 : false,
    9 : false,
    10 : false,
  },
    {
    1 : false,
    2 : false,
    3 : false,
    4 : false,
    5 : false,
    6 : false,
    7 : false,
    8 : false,
    9 : false,
    10 : false,
  },
    {
    1 : false,
    2 : false,
    3 : false,
    4 : false,
    5 : false,
    6 : false,
    7 : false,
    8 : false,
    9 : false,
    10 : false,
  },
];

  void reserveSeat(String seat){
    String columnString = seat[0];
    int row = int.parse(seat[1]);
    int column = 0;


    switch(columnString){
      case "A":
      break;
      case "B":
      column = 1;
      break;
      case "C":
      column = 2;
      break;
      case "D":
      column = 3;
      break;
      default: null;
    }


    if (reservedSeats[column].containsKey(row)) {
  reservedSeats[column][row] = true; // Safe update
  } 
}


}














