import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/team_selection_controller.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/team_selection/player_card.dart';

import '../../helper/post.dart';

class Draftboard extends StatelessWidget {
  Draftboard({super.key});

  final TeamSelectionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: MyColorHelper.white,
                borderRadius: BorderRadius.circular(12.0)),
            child: Card(
              elevation: 5.0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
                decoration: BoxDecoration(
                    color: MyColorHelper.primaryBackground,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Obx(
                  () => Container(
                      color: Colors.transparent,
                      child: controller.draftPlayers.isNotEmpty
                          ? ReorderableListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                for (int index = 0;
                                    index < controller.draftPlayers.length;
                                    index += 1)
                                  ReorderableDelayedDragStartListener(
                                    key: ValueKey(controller
                                        .draftPlayers[index].playerId),
                                    index: index,
                                    child: NBAPlayerCard(
                                      playerModel:
                                          controller.draftPlayers[index],
                                      showAddIcon: false,
                                    ),
                                  ),
                              ],
                              onReorder: (int oldIndex, int newIndex) {
                                final player =
                                    controller.draftPlayers.removeAt(oldIndex);
                                controller.draftPlayers.insert(
                                    newIndex > oldIndex
                                        ? newIndex - 1
                                        : newIndex,
                                    player);
                              },
                            )
                          : SizedBox(
                              height: context.height * 0.2,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: context.width * 0.1),
                                  child: const CustomTextWidget(
                                    text:
                                        'No Players Added\nAdd Players from Teams section to create your draftboard.',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () => showDialog(
              context: context,
              barrierDismissible: false,
              builder: (builder) => MyPostDialog(
                    onPost: (List<dynamic> title, List<dynamic> description) {
                      Get.find<TeamSelectionController>()
                          .onPost(title, description);
                    },
                  )),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: MyColorHelper.primary,
                borderRadius: BorderRadius.circular(8.0)),
            child: const CustomTextWidget(
              text: 'Create Post',
              textColor: Colors.white,
              fontSize: 12.0,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
