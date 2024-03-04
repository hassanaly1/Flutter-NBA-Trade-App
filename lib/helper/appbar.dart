import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/helper/textfield.dart';
import 'colors.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? prefixIconOnTap;
  final void Function()? sufixWidgetOnTap;
  final IconData? prefixIcon;
  final Widget? sufixWidget;
  final String title;

  const CustomAppBar({
    super.key,
    this.prefixIcon,
    required this.title,
    this.prefixIconOnTap,
    this.sufixWidget,
    this.sufixWidgetOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
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
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: context.height * 0.01),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: prefixIconOnTap,
                    child: Icon(
                      prefixIcon,
                      color: MyColorHelper.white,
                    )),
                CustomTextWidget(
                    text: title,
                    textColor: MyColorHelper.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                if (sufixWidget != null)
                  InkWell(onTap: sufixWidgetOnTap, child: sufixWidget!),
                if (sufixWidget == null) const SizedBox()
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
            child: CustomTextFormField(
              hint: "Search",
              fillColor: MyColorHelper.white,
              hintTextColor: MyColorHelper.textLightGrey,
              sufixIcon: const Icon(
                Icons.search,
                size: 20,
              ),
              validator: (value) => value, // Add a simple validator here
            ),
          ),
        ],
      ),
    );
  }
}
