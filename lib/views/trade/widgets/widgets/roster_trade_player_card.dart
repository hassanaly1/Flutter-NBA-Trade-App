import 'package:flutter/material.dart';
import 'package:nba_trade/helper/text.dart';

class RosterTradePlayerCard extends StatelessWidget {
  const RosterTradePlayerCard({
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
                      text: 'James Anderson ',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomTextWidget(
                      text: 'SG, 6’ 8” 3.3...',
                      textColor: Colors.grey,
                    ),
                    CustomTextWidget(text: '\$19.6M | 7 years'),
                  ],
                ),
              ),
            ),
            const VerticalDivider(color: Color(0xff860038), thickness: 6.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/trade-rank-1.png', height: 60),
            ),
            const VerticalDivider(color: Colors.black54, thickness: 2.0),
            const Icon(Icons.more_vert)

            // Icons and Button
          ],
        ),
      ),
    );
  }
}
