import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/models/my_team_model.dart';

class TradeController extends GetxController {
  var selectedTeams = <MyTeamModel>[].obs;
  var allPlayers = <MyPlayerModel>[].obs;

  void setPlayers(List<MyPlayerModel> players) {
    allPlayers.assignAll(players);
    debugPrint('AllPlayers: ${allPlayers.length}');
  }
}
