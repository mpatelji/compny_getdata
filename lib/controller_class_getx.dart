import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart'as http;

import 'model_class_company.dart';

class ViewData extends GetxController {
  var listData = <Datum>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCompaniesData();
  }

  void getCompaniesData() async {
    var path = Uri.parse("https://fakerapi.it/api/v1/companies?_quantity=10");

    var response = await http.get(path);
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var list = decode['data'];
      var userlist =
      list.map<Datum>((element) => Datum.fromJson(element)).toList();
      listData.addAll(userlist);
      update();
    } else {
      print("Failed to fetch data: ${response.statusCode}");
    }
  }
}
