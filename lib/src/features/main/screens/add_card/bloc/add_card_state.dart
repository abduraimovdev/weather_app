part of 'add_card_bloc.dart';

class AddCardState extends Equatable {
  final AddCardStatus status;
  final Color? color;
  final String? backgroundImg;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;

  const AddCardState({
    required this.status,
    this.color = Colors.blue,
    this.backgroundImg,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
  });

  @override
  List<Object?> get props => [
        status,
        color,
        backgroundImg,
        cardNumber,
        cardHolderName,
        expiryDate,
      ];

  AddCardState copyWith({
    AddCardStatus? status,
    Color? color,
    String? backgroundImg,
    String? cardNumber,
    String? cardHolderName,
    String? expiryDate,
  }) {
    return AddCardState(
      status: status ?? this.status,
      color: color,
      backgroundImg: backgroundImg,
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }
}

enum AddCardStatus {
  initial,
  imgChange,
  fieldChange,
  colorChange,
  errorAdd,
  successAdd,
}
