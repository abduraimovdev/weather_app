import 'package:flutter/material.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';
import 'package:weather_app/src/features/main/screens/add_card/data/models/card_model.dart';

import '../../../../../common/theme/theme.dart';




class WViewCard extends StatelessWidget {
  final CardModel card;

  const WViewCard({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: AppSize.radiusAll12,
            color: card.color,
            image: card.backgroundImg == null
                ? null
                : DecorationImage(
                    image: AssetImage(
                      card.backgroundImg!,
                    ),
                    fit: BoxFit.cover,
                  ),
          ),
          child: Padding(
            padding: AppSize.paddingAll20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Visa',
                      style: context.textStyle.kGreyStyle30wItalic
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.cardNumber,
                      style: context.textStyle.kGreyStyle30wBold
                    ),
                    AppSize.sizeH10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Card holder name',
                              style: context.textStyle.kGreyStyle12
                            ),
                            Text(
                              card.cardHolderName,
                              style: context.textStyle.kGreyStyle16
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Expiry date',
                              style: context.textStyle.kGreyStyle12
                            ),
                            Text(
                              card.expiryDate,
                              style: context.textStyle.kGreyStyle16
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/img_card_chip.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
