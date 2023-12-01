import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';

import '../../../../../common/theme/theme.dart';
import '../bloc/add_card_bloc.dart';

class WCard extends StatelessWidget {
  const WCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: BlocBuilder<AddCardBloc, AddCardState>(
          builder: (context, state) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppSize.radiusAll12,
                color: state.color,
                image: state.backgroundImg == null
                    ? null
                    : DecorationImage(
                        image: AssetImage(
                          state.backgroundImg!,
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
                          state.cardNumber,
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
                                  state.cardHolderName,
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
                                  state.expiryDate,
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
            );
          },
        ),
      ),
    );
  }
}
