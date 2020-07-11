import '../packages/card_selector.dart';
import 'package:flutter/material.dart';

import './charity_event_card.dart';

class CardsStack extends StatelessWidget {
  const CardsStack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardList = [
      CharityEventCard(),
      CharityEventCard(),
      CharityEventCard(),
    ];
    return Container(
      // padding: EdgeInsets.only(left: 20.0),
      height: MediaQuery.of(context).size.height * .6,
      child: CardSelector(
        mainCardWidth: MediaQuery.of(context).size.width * .8,
        mainCardHeight: MediaQuery.of(context).size.height * .57,
        cards: cardList,
        cardAnimationDurationMs: 400,
        cardsGap: 24,
        dropTargetWidth: 8.0,
        mainCardPadding: 20,
      ),
    );
  }
}

// Stack(
//         alignment: Alignment.center,
//         children: [
//           Positioned(
//             left: 90,
//             child: Opacity(
//               opacity: .80,
//               child: Transform.scale(
//                 scale: .85,
//                 child: CharityEventCard(),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 60,
//             child: Opacity(
//               opacity: .85,
//               child: Transform.scale(
//                 scale: .9,
//                 child: CharityEventCard(),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 20,
//             child: CharityEventCard(),
//           ),
//         ],
//       ),
