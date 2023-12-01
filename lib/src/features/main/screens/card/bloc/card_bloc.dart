import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/main/screens/add_card/domain/repository/card_repository.dart';

import '../../add_card/data/models/card_model.dart';

part 'card_event.dart';

part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepository repository;

  CardBloc({required this.repository})
      : super(const CardState(status: CardStatus.initial, cards: [])) {
    on<GetCardEvent>(_getCard);
  }

  void _getCard(GetCardEvent event, Emitter emit) async {
    emit(state.copyWith(status: CardStatus.loading));
    final response = await repository.getCards();

    emit(state.copyWith(status: CardStatus.success, cards: response));
  }
}
