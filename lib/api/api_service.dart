import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nba_trade/models/my_player_model.dart';

class ApiService {
  static String allPlayerApi =
      'https://api.sportsdata.io/v3/nba/scores/json/Players?key=ef1306f34f3a4e42b83a9523fc6882d5';

  static Future<List<MyPlayerModel>> fetchAllPlayers() async {
    print('API CALLED');
    var response = await http.get(Uri.parse(allPlayerApi));

    if (response.statusCode == 200) {
      print('CODE 200 FETCHING LIST');
      return List<MyPlayerModel>.from(
        json.decode(response.body).map(
              (x) => MyPlayerModel.fromJson(x),
            ),
      );
    } else {
      throw Exception("network error");
    }
  }
}
