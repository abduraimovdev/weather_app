part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();
}

class GetCardEvent extends CardEvent {
  const GetCardEvent();
  @override
  List<Object?> get props => [];
}
