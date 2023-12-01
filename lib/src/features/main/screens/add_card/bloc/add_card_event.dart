part of 'add_card_bloc.dart';

abstract class AddCardEvent extends Equatable {
  const AddCardEvent();
}

class AddCardBackgroundEvent extends AddCardEvent {
  final Color? color;
  final String? img;

  const AddCardBackgroundEvent({this.color, this.img});

  @override
  List<Object?> get props => [color, img];
}

class AddCardChangeEvent extends AddCardEvent {
  final String? cardNumber;
  final String? cardHolderName;
  final String? expiryDate;

  const AddCardChangeEvent({
    this.cardNumber,
    this.cardHolderName,
    this.expiryDate,
  });

  @override
  List<Object?> get props => [cardNumber, cardHolderName, expiryDate];
}

class CardAddEvent extends AddCardEvent {
  const CardAddEvent();

  @override
  List<Object?> get props => [];
}
