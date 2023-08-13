import 'dart:convert';

import 'package:get_api/dataclass.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<DataPerson>> getAllData() async {
    final hasilResponse = await http.get(
        Uri.parse("https://6283762138279cef71d77f41.mockapi.io/api/v1/Data"));

    if (hasilResponse.statusCode == 200) {
      List jsonResponse = json.decode(hasilResponse.body);
      return jsonResponse.map((data) => DataPerson.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
