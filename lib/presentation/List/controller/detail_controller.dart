import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/services/api_service.dart';

class DetailController with ChangeNotifier {
  DetailController(
    this.id,
  ) {
    getDetailData(
      id.toString(),
    );
  }

  int id;
  dynamic data = {};
  ApiServices _apiServices = ApiServices();
  bool isLoading = false;

  void getDetailData(String id) async {
    try {
      data = await _apiServices.getDetailData(id);
      notifyListeners();
      print('Detail data: $data');
      isLoading = true;
    } catch (e) {
      print('Error: $e');
    }
  }
}
