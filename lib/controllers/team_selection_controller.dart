import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/models/my_player_model.dart';

class TeamSelectionController extends GetxController {
  var draftPlayers = <MyPlayerModel>[].obs;

  //Add Players to Draftboard
  void addPlayersToDraftBoard(MyPlayerModel playerModel) {
    if (!draftPlayers.contains(playerModel)) {
      draftPlayers.add(playerModel);
    } else {
      draftPlayers.remove(playerModel);
    }
    debugPrint('${draftPlayers.length}');
  }

  //Remove Players from Draftboard
  void removePlayersFromDraftBoard(MyPlayerModel playerModel) {
    draftPlayers.remove(playerModel);
    debugPrint('${draftPlayers.length}');
  }
}
