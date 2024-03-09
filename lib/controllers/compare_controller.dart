import 'package:get/get.dart';
import 'package:nba_trade/models/player_stats_model.dart';

class CompareController extends GetxController {
  Rx<PlayerStatsModel?> selectedPlayer1 = Rx<PlayerStatsModel?>(null);
  Rx<PlayerStatsModel?> selectedPlayer2 = Rx<PlayerStatsModel?>(null);

  void setSelectedPlayer1(PlayerStatsModel value) {
    selectedPlayer1.value = value;
  }

  void setSelectedPlayer2(PlayerStatsModel value) {
    selectedPlayer2.value = value;
  }
}
