import 'dart:convert';

import 'package:covid19_tracker/app_url.dart';
import 'package:covid19_tracker/models/WorldStatesModel.dart';
import 'package:http/http.dart' as http;
class StatesServices{

  Future<WorldStatesModel> fetchWorldRecords() async{
    var response = await http.get(Uri.parse(AppUrl.worldStateApi));
   var responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return WorldStatesModel.fromJson(responseBody);
    }
    else{
      throw Exception('Error in fetchWorldRecords');
    }
  }

  Future<List<dynamic>> fetchCountriesListApi() async{
    var data;
    var response = await http.get(Uri.parse(AppUrl.countriesList));
     data = json.decode(response.body);
    if (response.statusCode == 200) {
      return data;
    }
    else{
      throw Exception('Error in fetchWorldRecords');
    }
  }
}


