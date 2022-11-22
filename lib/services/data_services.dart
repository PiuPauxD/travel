import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class DataServices {
  String baseURl = "https://www.pinterest.com/olegich604/travel/";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getPlaces';
    http.Response res = await http.get(Uri.parse(baseURl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
