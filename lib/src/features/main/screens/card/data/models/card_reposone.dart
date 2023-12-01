import '../../../add_card/data/models/card_model.dart';

class CardResponse {
  final List<CardModel> cards;

  const CardResponse({
    required this.cards,
  });
}