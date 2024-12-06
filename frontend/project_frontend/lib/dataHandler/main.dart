import 'api_service.dart';

void main(List<String> args) async {
  try {
    print('Fetching all stations...');
    final stations = await ApiService.getAllStations();
    print('Stations fetched successfully:');
    print(stations);
  } catch (e) {
    print('An error occurred while fetching stations: $e');
  }
}
