import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/models/my_team_model.dart';
import 'package:nba_trade/models/player_stats_model.dart';

class ApiService {
  static String baseUrl = 'https://api.sportsdata.io/v3/nba/scores/json';
  static String apiKey = 'ef1306f34f3a4e42b83a9523fc6882d5';
  static String allPlayerApi = '$baseUrl/Players?key=$apiKey';
  static String allTeamsApi = '$baseUrl/AllTeams?key=$apiKey';
  static String allPlayersStatsApi =
      'https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2023?key=$apiKey';

  static Future<List<MyPlayerModel>> fetchAllPlayers() async {
    var response = await http.get(Uri.parse(allPlayerApi));

    if (response.statusCode == 200) {
      print('PlayersApi Called Successfully.');
      List<dynamic> decodedData = json.decode(response.body);

      return List<MyPlayerModel>.from(
        decodedData.map(
          (x) => MyPlayerModel.fromMap(x),
        ),
      );
    } else {
      print('PlayersApi didn\'t Called Successfully.');
      throw Exception("network error");
    }
  }

  static Future<List<MyTeamModel>> fetchAllTeams() async {
    var response = await http.get(Uri.parse(allTeamsApi));

    if (response.statusCode == 200) {
      print('TeamsApi called Successfully.');
      List<dynamic> decodedData = json.decode(response.body);

      return List<MyTeamModel>.from(
        decodedData.map(
          (x) => MyTeamModel.fromMap(x),
        ),
      );
    } else {
      print('TeamsApi didn\'t call Successfully.');
      throw Exception("Network error");
    }
  }

  static Future<List<PlayerStatsModel>> fetchAllPlayersStatistics() async {
    var response = await http.get(Uri.parse(allPlayersStatsApi));

    if (response.statusCode == 200) {
      print('AllPlayersStatistics called Successfully.');
      List<dynamic> decodedData = json.decode(response.body);

      return List<PlayerStatsModel>.from(
        decodedData.map(
          (x) => PlayerStatsModel.fromMap(x),
        ),
      );
    } else {
      print('AllPlayersStatistics didn\'t call Successfully.');
      throw Exception("Network error");
    }
  }
}
