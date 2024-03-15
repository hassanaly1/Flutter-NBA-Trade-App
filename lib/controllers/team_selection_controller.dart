import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/models/my_player_model.dart';

class TeamSelectionController extends GetxController {
  final List<String> tabs = ['All', 'PG', 'SG', 'PF', 'SF', 'C'];
  ScrollController scrollController = ScrollController();
  final playersLength = 10.obs,
      draftPlayers = <MyPlayerModel>[].obs,
      filteredPlayers = <MyPlayerModel>[].obs;

  void loadPlayers(int i) {}

  void addOrRemovePlayer(MyPlayerModel playerModel) {
    !draftPlayers.contains(playerModel)
        ? draftPlayers.add(playerModel)
        : draftPlayers.remove(playerModel);
  }

  void onPost(List<dynamic> title, List<dynamic> description) {}
}
