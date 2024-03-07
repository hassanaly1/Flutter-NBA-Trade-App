import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';

class StaffTradePlayerCard extends StatelessWidget {
  const StaffTradePlayerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.black54)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/user-profile.jpg',
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextWidget(
                      text: 'Kevin Johnson',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomTextWidget(
                      text: 'Executive',
                      textColor: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            const VerticalDivider(color: Colors.black54, thickness: 2.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/svgs/76logo.svg',
                height: 60,
                color: MyColorHelper.primary,
              ),
            ),

            // Icons and Button
          ],
        ),
      ),
    );
  }
}
