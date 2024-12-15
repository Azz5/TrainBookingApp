import 'package:project_frontend/widgets/icon_seat.dart';

class Schedule{
  int scheduleId;
 //int scheduleId;
  String departureTime;
  String arrivalTime;
  String departureCity;
  String arrivalCity;
 String trainId;
 // int trainId;
  String date;
  Schedule(
   this.scheduleId,
    this.departureTime,
    this.arrivalTime,
    this.departureCity,
    this.arrivalCity,
   this.trainId,
    this.date
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

Map<int,List<List<IconSeat>>> seatsMapbyID= {
  
};

//seatsMapbyID.putIfAbsent(1, () => [[IconSeat()]]);

  List<List<IconSeat>> icons = [
    [
      const IconSeat(isReserved: false,id: 100,),
      const IconSeat(isReserved: false,id: 101,),
      const IconSeat(isReserved: false, id: 102,),
      const IconSeat(isReserved: false,id: 103,),
      const IconSeat(isReserved: false,id: 104,),
      const IconSeat(isReserved: false, id: 105,),
      const IconSeat(isReserved: false,id: 106,),
      const IconSeat(isReserved: false,id: 107,),
      const IconSeat(isReserved: false, id: 108,),
      const IconSeat(isReserved: false, id: 109)
    ],
    [
      const IconSeat(isReserved: false,id: 210,),
      const IconSeat(isReserved: false,id: 211,),
      const IconSeat(isReserved: false, id: 212,),
      const IconSeat(isReserved: false,id: 213,),
      const IconSeat(isReserved: false,id: 214,),
      const IconSeat(isReserved: false, id: 215,),
      const IconSeat(isReserved: false,id: 216,),
      const IconSeat(isReserved: false,id: 217,),
      const IconSeat(isReserved: false, id: 218,),
      const IconSeat(isReserved: false, id: 219)
    ],
    [
      const IconSeat(isReserved: false,id: 320,),
      const IconSeat(isReserved: false,id: 321,),
      const IconSeat(isReserved: false, id: 322,),
      const IconSeat(isReserved: false,id: 323,),
      const IconSeat(isReserved: false,id: 324,),
      const IconSeat(isReserved: false, id: 325,),
      const IconSeat(isReserved: false,id: 326,),
      const IconSeat(isReserved: false,id: 327,),
      const IconSeat(isReserved: false, id: 328,),
      const IconSeat(isReserved: false, id: 329)
    ],
    [
      const IconSeat(isReserved: false,id: 430,),
      const IconSeat(isReserved: false,id: 431,),
      const IconSeat(isReserved: false, id: 432,),
      const IconSeat(isReserved: false,id: 433,),
      const IconSeat(isReserved: false,id: 434,),
      const IconSeat(isReserved: false, id: 435,),
      const IconSeat(isReserved: false,id: 436,),
      const IconSeat(isReserved: false,id: 437,),
      const IconSeat(isReserved: false, id: 438,),
      const IconSeat(isReserved: false, id: 439)

    ],
  ];














