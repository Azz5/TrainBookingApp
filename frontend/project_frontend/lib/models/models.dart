

class Trip{
  int? trainId;
  String? departureTime;
  String? arrivalTime;
  String? departureCity;
  String? arrivalCity;
  Trip(
    this.trainId,
    this.departureTime,
    this.arrivalTime,
    this.departureCity,
    this.arrivalCity,
  );
}


class Reservation{
  int? day;
  String? month;
  String? seat;
  bool? paid;

  Reservation(
    this.day,
    this.month,
    this.seat,
    this.paid
  );
}

