import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/main/screens/add_card/data/models/card_model.dart';
import 'package:weather_app/src/features/main/screens/add_card/domain/params/card_params.dart';

import '../domain/repository/card_repository.dart';
import '../domain/usecase/add_card.dart';

part 'add_card_event.dart';

part 'add_card_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  final AddCard addCard;

  AddCardBloc({required this.addCard})
      : super(
          const AddCardState(
            cardNumber: '8800 0017 1705 5566',
            cardHolderName: 'Mustafo Alimov',
            expiryDate: '02/30',
            status: AddCardStatus.initial,
          ),
        ) {
    on<AddCardBackgroundEvent>(_backgroundChange);
    on<AddCardChangeEvent>(_fieldChange);
    on<CardAddEvent>(_addCard);
  }

  void _backgroundChange(AddCardBackgroundEvent event, Emitter emit) {
    if (event.img != null) {
      emit(
        state.copyWith(
          backgroundImg: event.img,
          status: AddCardStatus.imgChange,
        ),
      );
    }
    if (event.color != null) {
      emit(
        state.copyWith(
          color: event.color,
          status: AddCardStatus.colorChange,
        ),
      );
    }
  }

  void _fieldChange(AddCardChangeEvent event, Emitter emit) {
    if (event.expiryDate != null) {
      emit(
        state.copyWith(
          expiryDate: event.expiryDate,
          status: AddCardStatus.fieldChange,
          backgroundImg: state.backgroundImg,
          color: state.color,
        ),
      );
    }
    if (event.cardNumber != null) {
      emit(
        state.copyWith(
          cardNumber: event.cardNumber,
          status: AddCardStatus.fieldChange,
          backgroundImg: state.backgroundImg,
          color: state.color,
        ),
      );
    }
    if (event.cardHolderName != null) {
      emit(
        state.copyWith(
          cardHolderName: event.cardHolderName,
          status: AddCardStatus.fieldChange,
          backgroundImg: state.backgroundImg,
          color: state.color,
        ),
      );
    }
  }

  Future<void> _addCard(CardAddEvent event, Emitter emit) async {
    if ((state.color != null || state.backgroundImg != null) &&
        state.cardHolderName.isNotEmpty &&
        state.cardNumber.length > 18 &&
        state.expiryDate.length > 4) {
      final card = CardModel(
        color: state.color,
        backgroundImg: state.backgroundImg,
        cardNumber: state.cardNumber,
        cardHolderName: state.cardHolderName,
        expiryDate: state.expiryDate,
      );
      await addCard.call(CardAddParams(card));
      emit(
        state.copyWith(
          status: AddCardStatus.successAdd,
          color: state.color,
          backgroundImg: state.backgroundImg,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: AddCardStatus.errorAdd,
          color: state.color,
          backgroundImg: state.backgroundImg,
        ),
      );
    }
  }
}
