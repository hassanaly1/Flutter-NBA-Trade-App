import 'package:get/get.dart';
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/models/my_team_model.dart';

class TradeController extends GetxController {
  final selectedTeams = <MyTeamModel>[].obs;
  final selectedTeamsPlayers = <RxList<MyPlayerModel>>[];

  void onPlayerTeamChanged(MyPlayerModel playerModel, MyTeamModel toTeamModel) {
    int fromTeam = selectedTeams.indexOf(selectedTeams
        .firstWhere((element) => element.teamId == playerModel.teamId));
    int toTeam = selectedTeams.indexOf(toTeamModel);
    selectedTeamsPlayers[fromTeam].remove(playerModel);
    selectedTeamsPlayers[toTeam].insert(0, playerModel);
  }

  void onPost(List<dynamic> title, List<dynamic> description) {}
}
