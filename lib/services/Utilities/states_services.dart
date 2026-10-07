import 'dart:convert';

import 'package:covid19_tracker/model/world_states_model.dart';
import 'package:covid19_tracker/services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {

  Future<WorldStatesModel> fetchWorldStatesRecord () async {

    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);

    }else {

      throw Exception('Error');

    }

  }

}