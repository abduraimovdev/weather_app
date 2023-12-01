part of 'card_bloc.dart';

enum CardStatus {
  initial,
  success,
  error,
  loading,
}

class CardState extends Equatable {
  final CardStatus status;
  final List<CardModel> cards;

  const CardState({
    required this.status,
    required this.cards,
  });

  @override
  List<Object?> get props => [status, cards];

  CardState copyWith({
    CardStatus? status,
    List<CardModel>? cards,
  }) {
    return CardState(
      status: status ?? this.status,
      cards: cards ?? this.cards,
    );
  }
}
