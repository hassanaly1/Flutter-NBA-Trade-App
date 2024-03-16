import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/models/my_player_model.dart';

class TeamSelectionController extends GetxController {
  final List<String> tabs = ['All', 'PG', 'SG', 'PF', 'SF', 'C'];
  final _universalController = Get.find<UniversalController>();
  ScrollController scrollController = ScrollController();
  final playersLength = 0.obs,
      draftPlayers = <MyPlayerModel>[].obs,
      filteredPlayers = <MyPlayerModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void loadPlayers(int i) {
    filteredPlayers.clear();
    if (i == 0) {
      filteredPlayers.assignAll(_universalController.players);
    } else {
      filteredPlayers.assignAll(
          _universalController.players.where((p) => p.position == tabs[i]));
    }
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {}
  }

  void addOrRemovePlayer(MyPlayerModel playerModel) {
    !draftPlayers.contains(playerModel)
        ? draftPlayers.add(playerModel)
        : draftPlayers.remove(playerModel);
  }

  void onPost(List<dynamic> title, List<dynamic> description) {}
}
