import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nba_trade/helper/profile_avatar.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/helper/textfield.dart';
import 'colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showSearchBar;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showSearchBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: context.height * 0.005),
      decoration: const BoxDecoration(
        color: MyColorHelper.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(85, 0, 0, 0),
            blurRadius: 5.0,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.05,
              vertical: context.height * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Symbols.arrow_back_ios,
                    color: MyColorHelper.white,
                  ),
                ),
                CustomTextWidget(
                    text: title,
                    textColor: MyColorHelper.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                const ProfileAvatar()
              ],
            ),
          ),
          showSearchBar
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.1),
                  child: CustomTextFormField(
                    hint: "Search",
                    fillColor: MyColorHelper.white,
                    hintTextColor: MyColorHelper.textLightGrey,
                    sufixIcon: const Icon(Symbols.search, size: 20),
                    validator: (value) => value,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
