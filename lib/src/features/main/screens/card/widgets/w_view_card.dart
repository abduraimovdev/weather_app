import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';

import '../../../../../common/theme/theme.dart';

class WViewCard extends StatelessWidget {
  final String? backgroundImg;
  final Color? color;
  final String cardNumber;
  final String cardName;
  final String expiryDate;

  const WViewCard({
    super.key,
    required this.cardNumber,
    required this.cardName,
    required this.expiryDate,
    required this.color,
    required this.backgroundImg,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: DecoratedBox(
      decoration: BoxDecoration(
      borderRadius: AppSize.radiusAll12,
        color: color,
        image: backgroundImg == null
            ? null
            : DecorationImage(
          image: AssetImage(
            backgroundImg!,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Visa',
                  style: TextStyle(
                    color: context.color.white,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardNumber,
                  style: TextStyle(
                    color: context.color.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                AppSize.sizeH10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Card holder name',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          cardName,
                          style: TextStyle(
                            color: context.color.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Expiry date',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          expiryDate,
                          style: TextStyle(
                            color: context.color.white,
                            fontSize: 16,
                          ),
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
