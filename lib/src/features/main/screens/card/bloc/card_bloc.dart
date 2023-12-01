import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/main/screens/add_card/domain/repository/card_repository.dart';
import 'package:weather_app/src/features/main/screens/card/data/models/card_reposone.dart';
import 'package:weather_app/src/features/main/screens/card/domain/params/get_cards_params.dart';

import '../../add_card/data/models/card_model.dart';
import '../domain/usecase/get_cards.dart';

part 'card_event.dart';

part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final GetCards getCards;

  CardBloc({required this.getCards})
      : super(const CardState(status: CardStatus.initial)) {
    on<GetCardEvent>(_getCard);
  }

  void _getCard(GetCardEvent event, Emitter emit) async {
    emit(state.copyWith(status: CardStatus.loading));
    final response = await getCards.call(const GetCardsParams());
    response.fold(
      (l) {
        emit(state.copyWith(status: CardStatus.error));
      },
      (r) {
        emit(state.copyWith(status: CardStatus.success, data: r));
      },
    );
  }
}
