import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'https://rickandmortyapi.com/api/character';

  Future<List<dynamic>> getListData() async {
    final response = await http.get(Uri.parse('$baseUrl'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
        print('object: ${jsonResponse['results']}');
      return jsonResponse['results'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> getDetailData(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
