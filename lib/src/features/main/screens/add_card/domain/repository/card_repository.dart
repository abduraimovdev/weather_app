import 'package:weather_app/src/features/main/screens/add_card/data/models/card_model.dart';

abstract class CardRepository {
  const CardRepository();
  Future<void> setCard(CardModel card);
  Future<List<CardModel>> getCards();
}