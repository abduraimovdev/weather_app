import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';
import 'package:weather_app/src/features/main/screens/add_card/widgets/w_card.dart';
import 'package:weather_app/src/features/main/screens/card/widgets/w_view_card.dart';

import '../bloc/card_bloc.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.lightBlue,
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) => WViewCard(
              cardNumber: state.cards[index].cardNumber,
              cardName: state.cards[index].cardHolderName,
              expiryDate: state.cards[index].expiryDate,
              color: state.cards[index].color,
              backgroundImg: state.cards[index].backgroundImg,
            ),
          );
        },
      ),
    );
  }
}
