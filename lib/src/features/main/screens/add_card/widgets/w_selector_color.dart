
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/theme/theme.dart';
import '../bloc/add_card_bloc.dart';

class WSelectorColor extends StatelessWidget {
  const WSelectorColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 16,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: AppSize.paddingLeft16,
          child: GestureDetector(
            onTap: () {
              context.read<AddCardBloc>().add(AddCardBackgroundEvent(color: Colors.primaries[index]));
            },
            child: SizedBox(
              width: 50,
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.primaries[index],
                  borderRadius: AppSize.radiusAll40,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
