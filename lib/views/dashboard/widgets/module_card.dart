import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';

class ModulesCard extends StatelessWidget {
  const ModulesCard({
    super.key,
    required this.gridItemsData,
  });

  final List<Map<String, dynamic>> gridItemsData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
      child: SizedBox(
        height: Get.height * 0.3,
        child: Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          child: GridView.builder(
            padding: const EdgeInsets.all(4.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: gridItemsData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: context.height * 0.12,
              crossAxisCount: 4,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: context.width * 0.02,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              final card = gridItemsData[index];
              return CustomModuleWidget(
                text: card['text'],
                icon: card['icon'],
                onTap: card['onTap'],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomModuleWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onTap;
  const CustomModuleWidget({
    super.key,
    required this.text,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
              radius: 25,
              backgroundColor: MyColorHelper.buttonPrimary,
              child: Icon(
                icon,
                size: 25,
                color: MyColorHelper.white,
              )),
        ),
        CustomTextWidget(
          maxLines: 2,
          textColor: MyColorHelper.primary,
          text: text,
          fontSize: 10.0,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
