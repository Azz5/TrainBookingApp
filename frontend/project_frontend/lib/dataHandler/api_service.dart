import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3333';

  // ----------- PASSENGERS -----------
  // Get all passengers
  static Future<List<dynamic>> getAllPassengers() async {
    final response = await http.get(Uri.parse('$baseUrl/passenger'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch passengers');
    }
  }

  // Get a passenger by ID
  static Future<Map<String, dynamic>> getPassengerByID(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/passenger/$id'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Passenger not found');
    } else {
      throw Exception('Failed to fetch passenger by ID');
    }
  }



  // Create a new passenger
  static Future<void> createPassenger(
      Map<String, dynamic> passengerData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/passenger'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(passengerData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create passenger');
    }
  }

  // Update a passenger
  static Future<void> updatePassenger(
      String id, Map<String, dynamic> passengerData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/passenger/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(passengerData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update passenger');
    }
  }

  // Delete a passenger
  static Future<void> deletePassenger(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/passenger/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete passenger');
    }
  }

  // ----------- STATIONS -----------
  static Future<List<dynamic>> getAllStations() async {
    final response = await http.get(Uri.parse('$baseUrl/station'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch stations');
    }
  }

  static Future<Map<String, dynamic>> getStationByID(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/station/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Station not found');
    } else {
      throw Exception('Failed to fetch station by ID');
    }
  }

  static Future<void> createStation(Map<String, dynamic> stationData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/station'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(stationData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create station');
    }
  }

  static Future<void> updateStation(
      String id, Map<String, dynamic> stationData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/station/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(stationData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update station');
    }
  }

  static Future<void> deleteStation(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/station/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete station');
    }
  }

  // ----------- SCHEDULES -----------
  static Future<List<dynamic>> getAllSchedules() async {
    final response = await http.get(Uri.parse('$baseUrl/schedule'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch schedules');
    }
  }

  static Future<Map<String, dynamic>> getScheduleByID(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/schedule/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Schedule not found');
    } else {
      throw Exception('Failed to fetch schedule by ID');
    }
  }

  static Future<void> createSchedule(Map<String, dynamic> scheduleData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/schedule'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(scheduleData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create schedule');
    }
  }

  static Future<void> updateSchedule(
      String id, Map<String, dynamic> scheduleData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/schedule/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(scheduleData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update schedule');
    }
  }

  static Future<void> deleteSchedule(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/schedule/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete schedule');
    }
  }

  // ----------- TICKETS -----------
  static Future<List<dynamic>> getAllTickets() async {
    final response = await http.get(Uri.parse('$baseUrl/ticket'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch tickets');
    }
  }

  static Future<Map<String, dynamic>> getTicketByID(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/ticket/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Ticket not found');
    } else {
      throw Exception('Failed to fetch ticket by ID');
    }
  }

  static Future<void> createTicket(Map<String, dynamic> ticketData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/ticket'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(ticketData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create ticket');
    }
  }

  static Future<void> updateTicket(
      String id, Map<String, dynamic> ticketData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/ticket/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(ticketData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update ticket');
    }
  }

  static Future<void> deleteTicket(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/ticket/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete ticket');
    }
  }

  // ----------- RESERVATIONS -----------
  static Future<List<dynamic>> getAllReservations() async {
    final response = await http.get(Uri.parse('$baseUrl/reservation'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch reservation');
    }
  }

  static Future<Map<String, dynamic>> getReservationByID(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/reservations/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Reservation not found');
    } else {
      throw Exception('Failed to fetch reservation by ID');
    }
  }

  static Future<void> createReservation(
      Map<String, dynamic> reservationData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reservation'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(reservationData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create reservation');
    }
  }

  static Future<void> updateReservation(
      String id, Map<String, dynamic> reservationData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/reservation/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(reservationData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update reservation');
    }
  }

  static Future<void> deleteReservation(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/reservation/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete reservation');
    }
  }

  // ----------- TRAINS -----------
  static Future<List<dynamic>> getAllTrains() async {
    final response = await http.get(Uri.parse('$baseUrl/train'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch trains');
    }
  }

  static Future<Map<String, dynamic>> getTrainByID(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/train/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Train not found');
    } else {
      throw Exception('Failed to fetch train by ID');
    }
  }

  static Future<void> createTrain(Map<String, dynamic> trainData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/train'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(trainData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create train');
    }
  }

  static Future<void> updateTrain(
      String id, Map<String, dynamic> trainData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/train/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(trainData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update train');
    }
  }

  static Future<void> deleteTrain(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/train/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete train');
    }
  }
}
