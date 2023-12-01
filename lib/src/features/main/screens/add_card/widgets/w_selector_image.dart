import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/theme/app_img.dart';
import '../../../../../common/theme/theme.dart';
import '../bloc/add_card_bloc.dart';

class WSelectorImage extends StatelessWidget {
  const WSelectorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        itemCount: AppImg.cardBackgroundImages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              context.read<AddCardBloc>().add(AddCardBackgroundEvent(img: AppImg.cardBackgroundImages[index]));
            },
            child: SizedBox(
              width: 70,
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: AppSize.radiusAll12,
                  image: DecorationImage(
                    image: AssetImage(
                      AppImg.cardBackgroundImages[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
