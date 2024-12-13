import 'package:project_frontend/dataHandler/api_service.dart';

void main(List<String> args) async {
  print(await ApiService.getTrainsWithNoDriver());
}
