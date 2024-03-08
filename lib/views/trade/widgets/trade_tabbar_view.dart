import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/models/my_team_model.dart';
import 'package:nba_trade/views/trade/trade.dart';
import 'package:nba_trade/views/trade/widgets/trade_player_card.dart';

class TradeTabbarView extends StatefulWidget {
  final MyTeamModel myTeamModel;

  TradeTabbarView({
    Key? key,
    required this.myTeamModel,
  }) : super(key: key);

  @override
  _TradeTabbarViewState createState() => _TradeTabbarViewState();
}

class _TradeTabbarViewState extends State<TradeTabbarView> {
  late RxList<MyPlayerModel> myTeamPlayers;
  final UniversalController controller = Get.find();

  @override
  void initState() {
    super.initState();
    myTeamPlayers = controller.players
        .where((player) => player.teamId == widget.myTeamModel.teamId)
        .toList()
        .obs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: const BoxDecoration(
                        color: MyColorHelper.primary,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                spreadRadius: 2.0,
                                blurRadius: 10.0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.network(
                                widget.myTeamModel.wikipediaLogoUrl ?? '',
                                height: 50,
                              ),
                              const SizedBox(width: 8.0),
                              CustomTextWidget(
                                text:
                                    widget.myTeamModel.name ?? 'Not Specified',
                                textColor: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(width: 8.0),
                              CustomTextWidget(
                                text: widget.myTeamModel.teamId.toString() ??
                                    'Not Specified',
                                textColor: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 40.0,
                          endIndent: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomRichText(
                                heading: 'City',
                                value:
                                    widget.myTeamModel.city ?? 'Not Specified'),
                            CustomRichText(
                                heading: 'Conference',
                                value: widget.myTeamModel.conference ??
                                    'Not Specified'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomRichText(
                                heading: 'Division',
                                value: (widget.myTeamModel.division ??
                                    'Not Specified')),
                            CustomRichText(
                                heading: 'Global Team ID',
                                value: (widget.myTeamModel.globalTeamID
                                        .toString() ??
                                    'Not Specified')),
                            CustomRichText(
                                heading: 'Head Coach',
                                value: widget.myTeamModel.headCoach ??
                                    'Not Specified'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ReorderableListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (int index = 0;
                            index < myTeamPlayers.length;
                            index += 1)
                          ReorderableDelayedDragStartListener(
                            key: ValueKey(myTeamPlayers[index].playerId),
                            index: index,
                            child: TradePlayerCard(
                              playerModel: myTeamPlayers[index],
                            ),
                          ),
                      ],
                      onReorder: (int oldIndex, int newIndex) {
                        final player = myTeamPlayers.removeAt(oldIndex);
                        myTeamPlayers.insert(
                            newIndex > oldIndex ? newIndex - 1 : newIndex,
                            player);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
