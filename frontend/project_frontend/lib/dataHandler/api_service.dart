import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:3333';

  static String _formatDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }

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

  // Get a passenger by ID
  static Future<Map<String, dynamic>> getPassengerByEmail(String Email) async {
    final response = await http.get(Uri.parse('$baseUrl/passenger/by/$Email'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Passenger not found');
    } else {
      throw Exception('Failed to fetch passenger by Email');
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
  static Future<void> updatePassenger(String id,
      Map<String, dynamic> passengerData) async {
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
  // Get all stations
  static Future<List<dynamic>> getAllStations() async {
    final response = await http.get(Uri.parse('$baseUrl/station'));
    print('Status Code for getAllStations: ${response.statusCode}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch stations');
    }
  }

  // Get a station by ID
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

  // Create a new station
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

  // Update a station
  static Future<void> updateStation(String id,
      Map<String, dynamic> stationData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/station/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(stationData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update station');
    }
  }

  // Delete a station
  static Future<void> deleteStation(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/station/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete station');
    }
  }

  // ----------- SCHEDULES -----------
  // Get all schedules
  static Future<List<dynamic>> getAllSchedules() async {
    final response = await http.get(Uri.parse('$baseUrl/schedule'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch schedules');
    }
  }
  static Future<List<dynamic>> getAllAllSchedules() async {
    final response = await http.get(Uri.parse('$baseUrl/schedule/all'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch schedules');
    }
  }

    // Get a schedule by ID
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

  // Create a new schedule
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

  // Update a schedule
  static Future<void> updateSchedule(String id,
      Map<String, dynamic> scheduleData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/schedule/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(scheduleData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update schedule');
    }
  }

  // Delete a schedule
  static Future<void> deleteSchedule(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/schedule/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete schedule');
    }
  }

  // ----------- TICKETS -----------
  // Get all tickets
  static Future<List<dynamic>> getAllTickets() async {
    final response = await http.get(Uri.parse('$baseUrl/ticket'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch tickets');
    }
  }

  // Get a ticket by ID
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

  static Future<Map<String, dynamic>> getAllTicketDataByID(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/ticket/data/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Ticket not found');
    } else {
      throw Exception('Failed to fetch ticket by ID');
    }
  }

  // Create a new ticket
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

  // Update a ticket
  static Future<void> updateTicket(String id,
      Map<String, dynamic> ticketData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/ticket/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(ticketData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update ticket');
    }
  }

  // Delete a ticket
  static Future<void> deleteTicket(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/ticket/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete ticket');
    }
  }

  // ----------- RESERVATIONS -----------
  // Get all reservations
  static Future<List<dynamic>> getAllReservations() async {
    final response = await http.get(Uri.parse('$baseUrl/reservation'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch reservations');
    }
  }

  // Get a reservation by ID
  static Future<Map<String, dynamic>> getReservationByID(String id) async {
    final response =
    await http.get(Uri.parse('$baseUrl/reservation/$id')); // Corrected path
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Reservation not found');
    } else {
      throw Exception('Failed to fetch reservation by ID');
    }
  }

  // Create a new reservation
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

  static Future<Map<String, dynamic>> getReservationByEmail(
      String email) async {
    final response = await http.get(
        Uri.parse('$baseUrl/reservation/by/$email'));
    if (response.statusCode == 200) {
      // Assuming the server returns a single reservation as a JSON object
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('No reservation found for the provided email');
    } else {
      throw Exception('Failed to fetch reservation by email');
    }
  }

  // Update a reservation
  static Future<void> updateReservation(String id,
      Map<String, dynamic> reservationData) async {
    print("Updating Reservation with ID: $id");
    print("Data: ${jsonEncode(reservationData)}");

    final response = await http.put(
      Uri.parse('$baseUrl/reservation/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(reservationData),
    );

    if (response.statusCode != 200) {
      print("Error Response: ${response.body}");
      throw Exception('Failed to update reservation');
    }

    print('Reservation updated successfully');
  }

  // Delete a reservation
  static Future<bool> deleteReservation(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/reservation/$id'));
    if (response.statusCode == 200 || response.statusCode == 204) {
      return true; // Deletion successful
    } else {
      return false; // Deletion failed
    }
  }

  // ----------- TRAINS -----------
  // Get all trains
  static Future<List<dynamic>> getAllTrains() async {
    final response = await http.get(Uri.parse('$baseUrl/train'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch trains');
    }
  }

  // Get a train by ID
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

  static Future<List<dynamic>> getTrainsWithNoDriver() async {
    final response = await http.get(Uri.parse('$baseUrl/train/MissingDriver'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Trains not found');
    } else {
      throw Exception('Failed to fetch trains Missing Driver');
    }
  }

  static Future<List<dynamic>> getTrainsWithNoEngineer() async {
    final response =
    await http.get(Uri.parse('$baseUrl/train/MissingEngineer'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Trains not found');
    } else {
      throw Exception('Failed to fetch trains Missing Engineer');
    }
  }

  // Create a new train
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

  // Update a train
  static Future<void> updateTrain(String id,
      Map<String, dynamic> trainData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/train/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(trainData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update train');
    }
  }

  // Delete a train
  static Future<void> deleteTrain(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/train/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete train');
    }
  }

  // ----------- STAFF -----------
  // Get all staff members
  static Future<List<dynamic>> getAllStaff() async {
    final response = await http.get(Uri.parse('$baseUrl/staff'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch staff members');
    }
  }

  // Get a staff member by ID
  static Future<Map<String, dynamic>> getStaffByID(String staffID) async {
    final response = await http.get(Uri.parse('$baseUrl/staff/$staffID'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Staff member not found');
    } else {
      throw Exception('Failed to fetch staff member by ID');
    }
  }

  // Create a new staff member
  static Future<void> createStaff(Map<String, dynamic> staffData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/staff'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(staffData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create staff member');
    }
  }

  // Update a staff member
  static Future<void> updateStaff(String staffID,
      Map<String, dynamic> staffData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/staff/$staffID'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(staffData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update staff member');
    }
  }

  // Delete a staff member
  static Future<void> deleteStaff(String staffID) async {
    final response = await http.delete(Uri.parse('$baseUrl/staff/$staffID'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete staff member');
    }
  }

  // Assign a train to a staff member
  static Future<void> assignTrainToStaff(String staffID, String trainID,
      String scheduleDate) async {
    // Input Validation
    if (staffID.isEmpty) {
      throw Exception('Staff ID must not be empty.');
    }


    // Prepare the request body
    Map<String, dynamic> requestBody = {};
    if (trainID != null && scheduleDate != null) {
      requestBody['trainID'] = trainID;
      requestBody['scheduleDate'] = scheduleDate;
    } else {
      requestBody['trainID'] = null;
      requestBody['scheduleDate'] = null;
    }

    try {
      // Make the PUT request to assign/unassign the train
      final response = await http.put(
        Uri.parse('$baseUrl/staff/$staffID/assign-train'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      // Handle different response statuses
      if (response.statusCode == 200) {
        // Successfully assigned/unassigned
        print('Train assignment updated successfully.');
      } else if (response.statusCode == 400 || response.statusCode == 404) {
        // Client-side errors
        final responseBody = jsonDecode(response.body);
        final errorMessage = responseBody['error'] ??
            'Failed to assign/unassign train to staff member.';
        throw Exception(errorMessage);
      } else {
        // Other server-side errors
        throw Exception(
            'Failed to assign/unassign train to staff member. Status Code: ${response
                .statusCode}');
      }
    } catch (e) {
      // Handle network errors or JSON parsing errors
      throw Exception(
          'Error assigning/unassigning train to staff member: ${e.toString()}');
    }
  }


  // Remove assigned train from a staff member
  static Future<void> removeAssignedTrain(String staffID) async {
    final response = await http.put(
      Uri.parse('$baseUrl/staff/$staffID/remove-train'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to remove assigned train from staff member');
    }
  }

  // ----------- WAITLIST -----------
  // Get all waitlisted passengers for a specific train
  static Future<List<dynamic>> getWaitlistByTrain(String trainID) async {
    final response =
    await http.get(Uri.parse('$baseUrl/waitlist/train/$trainID'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch waitlist');
    }
  }

  // Add a passenger to the waitlist
  static Future<void> addToWaitlist(Map<String, dynamic> waitlistData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/waitlist'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(waitlistData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add to waitlist');
    }
  }

  // Remove a passenger from the waitlist
  static Future<void> removeFromWaitlist(String waitlistID) async {
    final response =
    await http.delete(Uri.parse('$baseUrl/waitlist/$waitlistID'));
    if (response.statusCode != 200) {
      throw Exception('Failed to remove from waitlist');
    }
  }

// Promote a passenger's priority in the waitlist
<<<<<<< HEAD
  static Future<void> promoteWaitlistEntry(String waitlistID, String scheduleDate, int seatNumber) async {
=======
  static Future<void> promoteWaitlistEntry(String waitlistID,
      String scheduleDate, String seatNumber) async {
>>>>>>> ee68c97d4845fa16f21808dba3c23479ae881ccd
    final response = await http.put(
      Uri.parse('$baseUrl/waitlist/promote/$waitlistID'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'scheduleDate': scheduleDate,
        'seatNumber': seatNumber,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to promote waitlist entry');
    } else {
      print("Workingggg !!!");
    }
  }
}
