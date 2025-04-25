import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/services/api_service.dart';

class ListController with ChangeNotifier {
  ListController() {
    getListData();
  }

  ApiServices _apiServices = ApiServices();
  List<dynamic> listData = [];

  void getListData() async {
    try {
      listData = await _apiServices.getListData();
      notifyListeners();
      print('List data: $listData');
    } catch (e) {
      print('Error: $e');
    }
  }
}
