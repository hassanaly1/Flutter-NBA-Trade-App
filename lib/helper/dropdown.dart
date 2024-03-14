import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/models/my_team_model.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final List<MyTeamModel> items;
  final Function(MyTeamModel?)? onChanged;
  const CustomDropdown({
    super.key,
    required this.items,
    this.onChanged,
    required this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        onTap: () => debugPrint('Dropdown tapped'),
        hint: CustomTextWidget(
          text: hintText,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        style: const TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
        padding: EdgeInsets.zero,
        decoration: InputDecoration(
            fillColor: MyColorHelper.primaryBackground,
            filled: true,
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            constraints: BoxConstraints(maxHeight: context.height * 0.08)),
        borderRadius: BorderRadius.circular(12.0),
        items: items
            .map((options) => DropdownMenuItem(
                value: options,
                child: CustomTextWidget(
                  text: options.name ?? '',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                )))
            .toList(),
        onChanged: onChanged,
        // onChanged: (value) {
        //   if (!controller.selectedTeams.contains(value)) {
        //     controller.selectedTeams.addNonNull(value!);
        //   } else {
        //     ToastMessage.showToastMessage(
        //         message: '${value?.name} is already selected.',
        //         backgroundColor: Colors.red);
        //   }
        //   print(controller.selectedTeams.length);
        // },
      ),
    );
  }
}
