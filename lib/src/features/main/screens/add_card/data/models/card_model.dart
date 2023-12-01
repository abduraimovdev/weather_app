import 'dart:ui';

class CardModel {
  Color? color;
  String? backgroundImg;
  String cardNumber;
  String cardHolderName;
  String expiryDate;

  CardModel({
    this.color,
    this.backgroundImg,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
  });

  Map<String, Object?> toJson() {
    return {
      'color': color?.value,
      'backgroundImg': backgroundImg,
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate,
    };
  }

  factory CardModel.fromJson(Map<String, Object?> json) {
    return CardModel(
      color: json['color'] != null ? Color(json['color'] as int) : null,
      backgroundImg: json['backgroundImg'] != null
          ? json['backgroundImg'] as String
          : null,
      cardNumber: json['cardNumber'] as String,
      cardHolderName: json['cardHolderName'] as String,
      expiryDate: json['expiryDate'] as String,
    );
  }

  @override
  String toString() {
    return 'CardModel{color: $color, backgroundImg: $backgroundImg, cardNumber: $cardNumber, cardHolderName: $cardHolderName, expiryDate: $expiryDate}';
  }
}
